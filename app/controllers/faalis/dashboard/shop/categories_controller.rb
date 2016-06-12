class Faalis::Dashboard::Shop::CategoriesController < ::Dashboard::ApplicationController
  engine 'Faalis::Shop::Engine'

  in_index do |resource|
    resource.attributes :title, :permalink, :parent, :lock, :members_only
  end

  in_form do |form|
    form.attributes except: [:user]

    form.attributes_properties parent: { as: :select },
      site: { as: :select }
  end
end
