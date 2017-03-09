class CreateFaalisFeatures < ActiveRecord::Migration
  def change
    create_table :faalis_features do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
