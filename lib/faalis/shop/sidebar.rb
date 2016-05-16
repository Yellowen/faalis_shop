class Faalis::Dashboard::Models::Sidebar
  def shop_entries
    menu I18n.t('faalis.shop.dashboard.shop'), icon: 'fa fa-cart-plus' do
      item(I18n.t('faalis.shop.dashboard.products'),
        model: 'Faalis::Shop::Product',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_products_path)
      item(I18n.t('faalis.shop.dashboard.categories'),
        model: 'Faalis::Shop::Category',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_categories_path)
    end
  end
end
