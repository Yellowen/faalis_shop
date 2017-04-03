class CreateFaalisShopFeatures < ActiveRecord::Migration
  def change
    create_table :faalis_shop_features do |t|
      t.string :name

      t.timestamps null: false
    end
    site_aware :faalis_shop_features
  end
end
