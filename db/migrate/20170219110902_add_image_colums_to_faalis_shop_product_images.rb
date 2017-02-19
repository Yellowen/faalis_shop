class AddImageColumsToFaalisShopProductImages < ActiveRecord::Migration
  def change
    add_attachment :faalis_shop_product_images, :image
  end
end
