module Faalis::Shop
  class ProductImage < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :product

    has_attached_file(:image,
      styles: {
        original: ['600x600', :png],
        thumb: ['360x270#', :png]
      },
      url: '/:class/:attachment/:style/:basename.:extension',
      path: ':rails_root/public/:class/:attachment/:style/:basename.:extension')

    validates_attachment_content_type(:image,
      content_type: %w(image/png image/jpeg),
      less_than:  10.megabytes)

  end
end
