require 'faker'

Fabricator :category, class_name: 'Faalis::Shop::Category' do
  title { Faker::Name.title }

  description 'sme desc'
  permalink 'category-1'
  members_only  false
  lock false
  user { Fabricate(:user, password: '123123',
                   password_confirmation: '123123') }

end
