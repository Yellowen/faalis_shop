class Faalis::Shop::Dashboard::CategoriesController < ::Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'

  in_index do |resource|
    resource.attributes :title, :permalink, :parent, :lock, :members_only
  end

  in_form do |form|
    form.attributes except: [:user]
  end

  private

  def before_create_hook(resource)
    resource.user = current_user
    resource.site = SiteFramework.current_site
  end
end
