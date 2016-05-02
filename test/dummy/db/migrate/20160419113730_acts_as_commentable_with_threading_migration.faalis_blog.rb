# This migration comes from faalis_blog (originally 20160216115103)
class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration
  def self.up
    create_table :faalis_comments, :force => true do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.string :title
      t.text :body
      t.string :subject
      t.integer :user_id, :null => false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end

    add_index :faalis_comments, :user_id
    add_index :faalis_comments, [:commentable_id, :commentable_type]
  end

  def self.down
    drop_table :faalis_comments
  end
end
