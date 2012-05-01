class AddUserToLink1 < ActiveRecord::Migration
  def change
    add_column :links, :user_id, :integer
  end
end
