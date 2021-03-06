class Faalis::Dashboard::Shop::ProductsController < ::Dashboard::ApplicationController
  #engine 'Faalis::Engine'


  engine 'Faalis::Engine'

  route_namespace "shop"

  in_index do |resource|
    #resource.attributes :title, :permalink, :parent, :lock, :members_only
  end

  in_form do |form|
    form.attributes except: [:user, :site]
    form.attributes_properties tax: { as: :number },
      price: { as: :number },
      special_price: { as: :number },
      discount: { as: :number }
  end

  private

  def before_create_hook(resource)
    resource.user = current_user
    resource.site = SiteFramework.current_site
  end
end
