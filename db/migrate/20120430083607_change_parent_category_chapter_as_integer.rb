class ChangeParentCategoryChapterAsInteger < ActiveRecord::Migration
  def up
    remove_column :categories,:chapter
    add_column :categories,:chapter, :integer
  end

  def down
  end
end
