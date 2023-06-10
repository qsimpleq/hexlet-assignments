class ChangeColumnNameToTitlePosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :name, :title
  end
end
