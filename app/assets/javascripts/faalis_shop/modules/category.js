
// Categories Module
var Categories = angular.module("Category", ["ListView", "Filter", "Anim", "Fields",]);

// Categories configuration section ---------------------------
Categories.config(["$routeProvider", function($routeProvider){

    // Add any route you need here
    $routeProvider.
        when("/categories", {
            templateUrl: template("category/index"),
            controller: "CategoryController"
        }).
        when("/categories/new",{
            templateUrl: template("category/new"),
            controller: "AddCategoryController"
        }).
        when("/categories/:id/edit",{
            templateUrl: template("category/new"),
            controller: "AddCategoryController"
        });

}]);

// Category index controller -------------------------------------------------------
// This controller is responsible for list page (index)
Categories.controller("CategoryController", ["$scope", "gettext", "Restangular", "catch_error", "$location",
                                      function($scope, gettext, API, catch_error, $location){

    $scope.filter_config = {
        list: API.all("categories")
    };
    $scope.categories = [];
    

    // details_template is the address of template which should load for
    // each item details section
    $scope.details_template = template("category/details");

    // Buttons for top of the list-view
    $scope.buttons = [
        {
            title: gettext("New"),
            icon: "fa fa-plus",
            classes: "btn tiny green",
            permission: {
              name: "create",
              model: "Category"
            },
            route: "#categories/new"

        },
        {
            title: gettext("Duplicate"),
            icon: "fa fa-files-o",
            classes: "btn tiny red",
            permission: {
              name: "create",
              model: "Category"
            },
            action: function(){
                var selected = _.find($scope.categories, function(x){
                    return x.is_selected === true;
                });

                if (selected === undefined ) {
                    error_message(gettext("You should only select one item to copy."));
                }
                else {
                    $location.path("/categories/-" + selected.id + "/edit");
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

        API.all("categories").customDELETE(query.join(","))
            .then(function(data) {

                $scope.categories = _.filter($scope.categories, function(x){
                    return !(query.indexOf(x.id) != -1);
                });
                success_message(data.msg);
            }, function(data){
                catch_error(data);
            });

    };
    /*
    API.all("categories").getList()
        .then(function(data){
            $scope.categories = data;
        }, function(data){
            catch_error(data);
        });
     */
}]);

Categories.controller("AddCategoryController", ["Restangular", "$scope", "$location", "$routeParams", "gettext", "catch_error", function(API, $scope, $location, $routeParams, gettext, catch_error){

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

        var obj = API.one("categories", $scope.obj_id).get()
                .then(function(data) {
                
                    $scope.name = data.name;
                    $scope.desc = data.desc;
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
        $location.path("categories");
    };

    $scope.save = function(save_another){
        $("small.error").html("");
        $("small.error").removeClass("error");

        var category = {category: {
            name: $scope.name,
            desc: $scope.desc,
            __res__: 0
        }};
        if (($scope.obj_id) && (is_copy === false)) {

            API.one("categories", $scope.obj_id).patch(category)
                .then(function(){
                    success_message(gettext("Category updated successfully."));
                    if (save_another) {
                        $(".form input").val("");
                    }
                    else {
                        $location.path("categories");
                    }
                }, function(data){
                    catch_error(data);
                });

        }
        else {
            API.all("categories").customPOST(category, "").then(function(){
                success_message(gettext("Category created successfully."));
                if (save_another) {
                    $(".form input").val("");
                }
                else {
                    $location.path("categories");
                }
            }, function(data){
                catch_error(data);
            });
        }

    };
}]);

