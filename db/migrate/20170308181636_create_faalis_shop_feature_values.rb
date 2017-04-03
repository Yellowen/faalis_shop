class CreateFaalisShopFeatureValues < ActiveRecord::Migration
  def change
    create_table :faalis_shop_feature_values do |t|
      t.integer :feature_id
      t.string :value
      t.timestamps null: false
    end
    site_aware :faalis_shop_feature_values
  end
end
