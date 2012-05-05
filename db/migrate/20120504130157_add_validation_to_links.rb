class AddValidationToLinks < ActiveRecord::Migration
  def change
    add_column :links, :validated, :boolean
  end
end
