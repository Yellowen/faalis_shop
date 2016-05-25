class CreateFaalisShopCategories < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_shop_categories, **args do |t|
      t.string :title
      t.text :description
      t.string :permalink

      t.boolean :lock,          default: false
      t.boolean :members_only, default: false

      if Faalis::Engine.use_uuid
        t.uuid :parent_id
        t.uuid :user_id
      else

        t.integer :parent_id
        t.integer :user_id
      end

      t.timestamps null: false
    end

    add_index :faalis_shop_categories, :permalink
    site_aware :faalis_shop_categories
  end
end
