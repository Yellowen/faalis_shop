class CreateFaalisBlogPosts < ActiveRecord::Migration
  def change
    create_table :faalis_blog_posts do |t|
      t.string :title
      t.string :permalink
      t.text   :raw_content
      t.text   :content
      t.integer :category_id
      t.boolean :published
      t.integer :user_id
      t.boolean :allow_comments, default: true
      t.boolean :members_only, default: false

      t.string :meta_title
      t.string :meta_description

      t.timestamps null: false
    end

    add_index :faalis_blog_posts, :category_id
    domain_aware :faalis_blog_posts
  end
end
