class Faalis::Dashboard::Shop::FeatureValuesController < Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'

  in_form do |form|
    form.attributes except: [:user]

    form.attributes_properties parent: { as: :select },
      site: { as: :select }
  end
end
