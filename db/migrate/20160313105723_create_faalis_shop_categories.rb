class CreateFaalisShopCategories < ActiveRecord::Migration
  def change
    create_table :faalis_shop_categories do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.integer :parent_id
      t.boolean :lock,          default: true
      t.boolean :members_only, default: false
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :faalis_shop_categories, :permalink
    site_aware :faalis_shop_categories
  end
end
