class Faalis::Blog::Dashboard::PostsController < ::Dashboard::ApplicationController
  engine 'Faalis::Blog::Engine'

  in_index do |f|
    f.attributes(:title, :permalink, :category, :domain, :members_only, :allow_comments)
  end

  in_form do |f|
    f.attributes(:title, :permalink, :meta_title, :meta_description,
                 :category, :domain, :raw_content, :tags,
                 :members_only, :allow_comments)

    f.attributes_properties tags: { input_html: { :class => 'multiple select' } }
  end

  private

  def create_hook(resource)
    resource.user = current_user
  end
end
