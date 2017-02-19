class AddImageColumsToProductImages < ActiveRecord::Migration
  def change
    add_attachment :product_image, :image
  end
end
