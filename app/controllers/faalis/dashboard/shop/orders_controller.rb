class Faalis::Dashboard::Shop::OrdersController < Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'

  in_index do |resource|
    resource.attributes except: [:updated_at]
  end

  in_form do |form|
    form.attributes except: [:user]

    form.attributes_properties tax: { as: :number }

  end
end
