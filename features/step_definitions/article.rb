Given(/^there is a article named "(.*?)" in database$/) do |name|
  Article.new(:name => name).save!
end

Then(/^there shouldn't be any article$/) do
  Article.all.count.should == 0
end
