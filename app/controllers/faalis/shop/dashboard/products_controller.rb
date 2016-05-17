class Faalis::Shop::Dashboard::ProductsController < ::Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'

  in_index do |resource|
    #resource.attributes :title, :permalink, :parent, :lock, :members_only
  end

  in_form do |form|
    form.attributes except: [:user]

    form.attributes_properties price: { as: :string }
    form.attributes_properties site: { as: :select }
    form.attributes_properties category: { as: :select }
  end

  private

  def before_create_hook(resource)
    resource.user = current_user
    resource.site = SiteFramework.current_site
  end
end
