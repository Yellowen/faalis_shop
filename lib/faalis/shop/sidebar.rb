class Faalis::Dashboard::Models::Sidebar
  def shop_entries
    menu I18n.t('faalis.shop.dashboard.shop'), icon: 'fa fa-cart-plus' do
      item(I18n.t('faalis.shop.dashboard.products'),
        model: 'Faalis::Shop::Product',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_products_path)
      item(I18n.t('faalis.shop.dashboard.categories'),
        model: 'Faalis::Shop::Category',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_categories_path)
      item(I18n.t('faalis.shop.dashboard.orders'),
        model: 'Faalis::Shop::Order',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_orders_path)
      item(I18n.t('faalis.shop.dashboard.order_items'),
        model: 'Faalis::Shop::OrderItem',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_order_items_path)
    end
  end
end
