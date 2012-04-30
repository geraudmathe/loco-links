class ChangeParentCategoryChapterAsInteger < ActiveRecord::Migration
  def up
    change_column :categories,:chapter, :integer
  end

  def down
  end
end
