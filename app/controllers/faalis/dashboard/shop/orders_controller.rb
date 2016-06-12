class Faalis::Dashboard::Shop::OrdersController < Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'

  in_index do |resource|
    resource.attributes except: [:updated_at]
  end

  in_form do |form|
    form.attributes except: [:user] unless current_user.admin?
  end

  def before_create_hook(resource)
    if !current_user.admin?
      resource.user = current_user
    end
  end
end
