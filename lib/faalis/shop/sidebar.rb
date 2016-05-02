class Faalis::Dashboard::Models::Sidebar
  def shop_entries
    menu I18n.t('faalis.page.dashboard.shop'), icon: 'fa fa-globe' do
      item(I18n.t('faalis.page.dashboard.posts'),
        model: 'Faalis::Shop::Post',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_posts_path)
      item(I18n.t('faalis.page.dashboard.categories'),
        model: 'Faalis::Shop::Category',
        url: Faalis::Shop::Engine.routes.url_helpers.dashboard_categories_path)
    end
  end
end
