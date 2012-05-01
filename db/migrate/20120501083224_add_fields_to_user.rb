class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :twitter, :string
  end
end
