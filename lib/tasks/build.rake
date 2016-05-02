namespace :build do

  desc "Create article scaffold"
  task :article do
    system "rails g faalis:js_scaffold article title:string content:text publish:boolean meta_title:string meta_desc:text --no_bulk --menu Articles:/articles, Categories:/article_categories"
  end

  desc "Create category scaffold"
  task :category do
    system "rails g faalis:js_scaffold category name:string desc:text --no_bulk"
  end
end
