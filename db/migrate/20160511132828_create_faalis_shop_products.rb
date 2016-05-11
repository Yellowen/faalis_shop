class CreateFaalisShopProducts < ActiveRecord::Migration
  def change
    create_table :faalis_shop_products do |t|
      t.integer :user_id
      t.string :name
      t.float :price
      t.integer :category_id
      t.boolean :lock
      t.boolean :private
      t.text :description

      t.timestamps null: false

      if Faalis::Engine.use_uuid
        t.uuid :parent_id
        t.uuid :user_id
      else
        t.integer :user_id
      end

    end

    args[:id] = :uuid if Faalis::Engine.use_uuid
  end
end
