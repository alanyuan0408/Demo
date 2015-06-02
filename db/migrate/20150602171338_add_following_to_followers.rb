class AddFollowingToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :following, :string
  end
end
