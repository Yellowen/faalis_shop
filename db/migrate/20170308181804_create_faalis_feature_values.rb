class CreateFaalisFeatureValues < ActiveRecord::Migration
  def change
    create_table :faalis_feature_values do |t|
      t.string :name
      t.integer :feature_id

      t.timestamps null: false
    end
  end
end
