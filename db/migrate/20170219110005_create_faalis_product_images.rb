class CreateFaalisProductImages < ActiveRecord::Migration
  def change
    create_table :faalis_product_images do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
