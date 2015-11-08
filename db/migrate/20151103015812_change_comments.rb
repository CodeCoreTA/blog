class ChangeComments < ActiveRecord::Migration
  # adding foreign_key to associate the comment with a post
  def change
    change_table :comments do |t|
      t.references :post, index: true, foreign_key: true
    end
  end
end
