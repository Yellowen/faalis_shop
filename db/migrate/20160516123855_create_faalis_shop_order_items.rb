class CreateFaalisShopOrderItems < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_order_items, **args do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :total

      if Faalis::Engine.use_uuid
        t.uuid :user_id
      else
        t.integer :user_id
      end

      t.timestamps null: false
      site_aware :faalis_shop_order_item
    end
  end
end
