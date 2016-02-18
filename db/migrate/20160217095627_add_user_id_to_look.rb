class AddUserIdToLook < ActiveRecord::Migration
  def change
    add_column :looks, :user_id, :integer
  end
end
