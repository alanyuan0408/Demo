class AddUserToFollowers < ActiveRecord::Migration
  def change
    add_reference :followers, :user, index: true
    add_foreign_key :followers, :users
  end
end
