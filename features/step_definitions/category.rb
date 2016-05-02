Given(/^there is a category named "(.*?)" in database$/) do |name|
  Category.new(:name => name).save!
end

Then(/^there shouldn't be any category$/) do
  Category.all.count.should == 0
end
