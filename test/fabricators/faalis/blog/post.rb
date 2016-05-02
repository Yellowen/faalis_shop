require 'faker'

Fabricator :post, class_name: 'Faalis::Blog::Post' do
  title { Faker::Name.title }
  raw_content '#test1'
  permalink 'category-1'
  members_only  false
  published false
  allow_comments true
  user { Fabricate(:user, password: '123123',
                   password_confirmation: '123123') }
  category { Fabricate(:category) }
end
