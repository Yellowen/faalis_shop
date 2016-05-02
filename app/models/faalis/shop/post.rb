# == Schema Information
#
# Table name: faalis_blog_posts
#
#  id               :integer          not null, primary key
#  title            :string
#  permalink        :string
#  raw_content      :text
#  content          :text
#  category_id      :integer          not null
#  published        :boolean
#  user_id          :integer          not null
#  views            :integer          default(0)
#  likes            :integer          default(0)
#  dislikes         :integer          default(0)
#  allow_comments   :boolean          default(TRUE)
#  members_only     :boolean          default(FALSE)
#  meta_title       :string
#  meta_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  domain_id        :integer
#

module Faalis::Blog
  class Post < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    # adds tags field, tag_list params should be provided to initializer
    # in order to save a post
    acts_as_taggable

    # Render the markdown and cache it to content field
    before_save :render_content

    belongs_to :user, class_name: 'Faalis::User'
    belongs_to :category, class_name: 'Faalis::Blog::Category'

    # Returns all the published posts
    scope :published, -> { where(published: true) }
    scope :ordered, -> { order('created_at DESC') }


    validates_presence_of :title, :permalink, :user, :category


    private

    def render_content
      unless raw_content.blank?
        markdown = ::Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        self.content  = markdown.render(raw_content)
      end
    end
  end
end
