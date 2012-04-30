class AddClicksCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :clicks, :integer
  end
end
