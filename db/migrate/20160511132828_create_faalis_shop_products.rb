class CreateFaalisShopProducts < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_shop_products, **args do |t|
      t.string :name
      t.decimal :price
      t.decimal :tax
      t.decimal :special_price
      t.decimal :discount
      t.boolean :lock, default: false
      t.boolean :private
      t.text :description
      t.string :permalink


      t.timestamps null: false

      if Faalis::Engine.use_uuid
        t.uuid :user_id
        t.uuid :category_id
      else
        t.integer :user_id
        t.integer :category_id
      end

    end

    args[:id] = :uuid if Faalis::Engine.use_uuid
    site_aware :faalis_shop_products
  end
end
