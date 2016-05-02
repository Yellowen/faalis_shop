class Faalis::Dashboard::Models::Sidebar
  def blog_entries
    menu I18n.t('faalis.page.dashboard.blog'), icon: 'fa fa-globe' do
      item(I18n.t('faalis.page.dashboard.posts'),
        model: 'Faalis::Blog::Post',
        url: Faalis::Blog::Engine.routes.url_helpers.dashboard_posts_path)
      item(I18n.t('faalis.page.dashboard.categories'),
        model: 'Faalis::Blog::Category',
        url: Faalis::Blog::Engine.routes.url_helpers.dashboard_categories_path)
    end
  end
end
