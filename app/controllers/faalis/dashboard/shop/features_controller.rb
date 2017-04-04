class Faalis::Dashboard::Shop::FeaturesController < Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'
  route_namespace "shop"

  in_form do |form|
    form.attributes except: [:site]
  end

  private

  def before_create_hook(resource)
    resource.site = SiteFramework.current_site
  end

end
