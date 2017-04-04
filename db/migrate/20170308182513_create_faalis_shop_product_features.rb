class CreateFaalisShopProductFeatures < ActiveRecord::Migration
  def change
    create_table :faalis_shop_product_features do |t|
      t.integer :feature_id
      t.integer :feature_value_id
      t.integer :product_id
      t.string :value

      t.timestamps null: false
    end
    site_aware :faalis_shop_product_features
  end
end
