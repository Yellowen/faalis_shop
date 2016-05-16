class CreateFaalisOrders < ActiveRecord::Migration
  def change
    create_table :faalis_orders do |t|
      t.integer :status
      t.float :tax

      t.timestamps null: false
    end
  end
end
