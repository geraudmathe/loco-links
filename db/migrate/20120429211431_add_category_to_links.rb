class AddCategoryToLinks < ActiveRecord::Migration
  def change
    add_column :links , :category_id, :integer
  end
end
