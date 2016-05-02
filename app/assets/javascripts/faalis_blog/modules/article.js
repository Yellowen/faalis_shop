
// Articles Module
var Articles = angular.module("Article", ["ListView", "Filter", "Anim", "Fields",]);

// Articles configuration section ---------------------------
Articles.config(["$routeProvider", function($routeProvider){

    // Add any route you need here
    $routeProvider.
        when("/articles", {
            templateUrl: template("article/index"),
            controller: "ArticleController"
        }).
        when("/articles/new",{
            templateUrl: template("article/new"),
            controller: "AddArticleController"
        }).
        when("/articles/:id/edit",{
            templateUrl: template("article/new"),
            controller: "AddArticleController"
        });

}]);

// Article index controller -------------------------------------------------------
// This controller is responsible for list page (index)
Articles.controller("ArticleController", ["$scope", "gettext", "Restangular", "catch_error", "$location",
                                      function($scope, gettext, API, catch_error, $location){

    $scope.filter_config = {
        list: API.all("articles")
    };
    $scope.articles = [];
    

    // details_template is the address of template which should load for
    // each item details section
    $scope.details_template = template("article/details");

    // Buttons for top of the list-view
    $scope.buttons = [
        {
            title: gettext("New"),
            icon: "fa fa-plus",
            classes: "btn tiny green",
            permission: {
              name: "create",
              model: "Article"
            },
            route: "#articles/new"

        },
        {
            title: gettext("Duplicate"),
            icon: "fa fa-files-o",
            classes: "btn tiny red",
            permission: {
              name: "create",
              model: "Article"
            },
            action: function(){
                var selected = _.find($scope.articles, function(x){
                    return x.is_selected === true;
                });

                if (selected === undefined ) {
                    error_message(gettext("You should only select one item to copy."));
                }
                else {
                    $location.path("/articles/-" + selected.id + "/edit");
                }
            }
        }

    ];
    /*
     * On delete event handler - `items` is an array of objects to delete
     */
    $scope.on_delete = function(items){

        var query = [];
        items.forEach(function(item){
            query.push(item.id);
        });

        API.all("articles").customDELETE(query.join(","))
            .then(function(data) {

                $scope.articles = _.filter($scope.articles, function(x){
                    return !(query.indexOf(x.id) != -1);
                });
                success_message(data.msg);
            }, function(data){
                catch_error(data);
            });

    };
    /*
    API.all("articles").getList()
        .then(function(data){
            $scope.articles = data;
        }, function(data){
            catch_error(data);
        });
     */
}]);

Articles.controller("AddArticleController", ["Restangular", "$scope", "$location", "$routeParams", "gettext", "catch_error", function(API, $scope, $location, $routeParams, gettext, catch_error){

    $scope.select2options = {};
    $scope.editing = false;
    $scope.obj_id = null;
    var is_copy = false;

    
    
    if( "id" in $routeParams ){
        $scope.obj_id = $routeParams.id;
        $scope.editing = true;
        if ($scope.obj_id < 0) {
            is_copy = true;
            $scope.obj_id = $scope.obj_id * -1;
        }

        var obj = API.one("articles", $scope.obj_id).get()
                .then(function(data) {
                
                    $scope.title = data.title;
                    $scope.content = data.content;
                    $scope.publish = to_boolean(data.publish);
                    $scope.meta_title = data.meta_title;
                    $scope.meta_desc = data.meta_desc;
                }, function(data){
                    catch_error(data);
                });

    }

    $scope.have = function(field, obj_id) {
        var tmp = _.where($scope[field], {id: obj_id});
        if (tmp.length > 0) {
            return true;
        }
        else {
            return false;
        }
    };

    $scope.cancel = function(){
        $(".form input").val("");
        $location.path("articles");
    };

    $scope.save = function(save_another){
        $("small.error").html("");
        $("small.error").removeClass("error");

        var article = {article: {
            title: $scope.title,
            content: $scope.content,
            publish: $scope.publish,
            meta_title: $scope.meta_title,
            meta_desc: $scope.meta_desc,
            __res__: 0
        }};
        if (($scope.obj_id) && (is_copy === false)) {

            API.one("articles", $scope.obj_id).patch(article)
                .then(function(){
                    success_message(gettext("Article updated successfully."));
                    if (save_another) {
                        $(".form input").val("");
                    }
                    else {
                        $location.path("articles");
                    }
                }, function(data){
                    catch_error(data);
                });

        }
        else {
            API.all("articles").customPOST(article, "").then(function(){
                success_message(gettext("Article created successfully."));
                if (save_another) {
                    $(".form input").val("");
                }
                else {
                    $location.path("articles");
                }
            }, function(data){
                catch_error(data);
            });
        }

    };
}]);

Articles.controller("ArticleMenuController", ["gettext", function(gettext){
    this.menu_items = [
        {title: gettext("Articles"), url: "/articles"},
        ];
}]);
