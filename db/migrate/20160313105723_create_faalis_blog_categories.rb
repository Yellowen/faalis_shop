class CreateFaalisBlogCategories < ActiveRecord::Migration
  def change
    create_table :faalis_blog_categories do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.boolean :members_only, default: false

      t.timestamps null: false
    end

    domain_aware :faalis_blog_categories
  end
end
