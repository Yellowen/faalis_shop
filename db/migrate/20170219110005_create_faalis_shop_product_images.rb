class CreateFaalisShopProductImages < ActiveRecord::Migration
  def change
    create_table :faalis_shop_product_images do |t|
      t.string :name
      t.text :description
      t.integer :product_id
      t.timestamps null: false
    end
    site_aware :faalis_shop_product_images
  end
end
