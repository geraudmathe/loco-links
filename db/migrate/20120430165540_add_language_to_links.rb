class AddLanguageToLinks < ActiveRecord::Migration
  def change
    add_column :links, :language, :string
  end
end
