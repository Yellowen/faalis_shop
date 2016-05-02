class Dashboard::ApplicationController < Faalis::Dashboard::ApplicationController

  def setup_sidebar
    @sidebar = sidebar(t('faalis.engine_name')) do |s|
      s.faalis_entries
      s.shop_entries
    end
  end
end
