# == Schema Information
#
# Table name: faalis_shop_categories
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  permalink    :string
#  parent_id    :integer
#  lock         :boolean          default(TRUE)
#  members_only :boolean          default(FALSE)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  domain_id    :integer
#

require 'test_helper'

module Faalis::Shop
  class CategoryTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Shop::Category

    test "won't save without a title" do
      subject = @@subject.new(permalink: 'category-1')

      result = subject.save

      assert_not result, msg: 'Category saved without a title.'
    end

    test "permalink is unique" do
      @@subject.create(title: 't1', permalink: 'p1')
      c2 = @@subject.new(title: 't2', permalink: 'p1')

      result = c2.save

      assert_not result, msg: 'Category saved with permalink duplication'
    end


    test "'available' returns unlocked categories" do
      @@subject.create(title: 't1', permalink: 'p1', lock: false)
      @@subject.create(title: 't2', permalink: 'p2', lock: true)

      result = @@subject.available.count

      assert_equal 1, result
    end

    test "'visible' returns visible categories by user" do
      @@subject.create(title: 't1', permalink: 'p1', members_only: false)
      @@subject.create(title: 't2', permalink: 'p2', members_only: true)
      signed_in = false

      result = @@subject.visible(signed_in).count

      assert_equal 1, result
    end
  end
end
