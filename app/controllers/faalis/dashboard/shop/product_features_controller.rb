class Faalis::Dashboard::Shop::ProductFeaturesController < Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'
  route_namespace "shop"

  in_form do |form|
    form.attributes except: [:site]
    #form.attributes_properties  site: { as: :select }
  end

  private

  def before_create_hook(resource)
    resource.site = SiteFramework.current_site
  end
end
