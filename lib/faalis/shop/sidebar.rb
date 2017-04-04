class Faalis::Dashboard::Models::Sidebar
  def shop_entries
    menu I18n.t('faalis.shop.dashboard.shop'), icon: 'fa fa-cart-plus' do
      item(I18n.t('faalis.shop.dashboard.products'),
        model: 'Faalis::Shop::Product',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_products_path)
      item(I18n.t('faalis.shop.dashboard.categories'),
        model: 'Faalis::Shop::Category',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_categories_path)
      item(I18n.t('faalis.shop.dashboard.orders'),
        model: 'Faalis::Shop::Order',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_orders_path)
      item(I18n.t('faalis.shop.dashboard.features'),
        model: 'Faalis::Shop::Feature',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_features_path)
    end
  end
end
