class CreateFaalisProductFeatures < ActiveRecord::Migration
  def change
    create_table :faalis_product_features do |t|
      t.integer :feature_id
      t.integer :feature_value_id
      t.string :value

      t.timestamps null: false
    end
  end
end
