class CreateFaalisShopOrders < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_orders, **args do |t|
      t.integer :status
      t.float :tax

      if Faalis::Engine.use_uuid
        t.uuid :user_id
      else
        t.integer :user_id
      end

      t.timestamps null: false
      site_aware :faalis_shop_categories
    end
  end
end