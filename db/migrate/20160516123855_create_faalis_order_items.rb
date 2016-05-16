class CreateFaalisOrderItems < ActiveRecord::Migration
  def change
    create_table :faalis_order_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :total

      t.timestamps null: false
    end
  end
end
