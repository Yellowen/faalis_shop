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
      item(I18n.t('faalis.shop.dashboard.order_items'),
        model: 'Faalis::Shop::OrderItem',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_order_items_path)
      item(I18n.t('faalis.shop.dashboard.features'),
        model: 'Faalis::Shop::Feature',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_features_path)
      item(I18n.t('faalis.shop.dashboard.feature_values'),
        model: 'Faalis::Shop::FeatureValue',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_feature_values_path)
      item(I18n.t('faalis.shop.dashboard.product_features'),
        model: 'Faalis::Shop::ProductFeature',
        url: Faalis::Engine.routes.url_helpers.dashboard_shop_product_features_path)
    end
  end
end
