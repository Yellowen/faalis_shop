class CreateFaalisProductFeatureValues < ActiveRecord::Migration
  def change
    create_table :faalis_product_feature_values do |t|
      t.string :name
      t.integer :product_feature_id

      t.timestamps null: false
    end
  end
end
