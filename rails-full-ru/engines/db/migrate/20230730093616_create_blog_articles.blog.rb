# This migration comes from blog (originally 20230730093527)
class CreateBlogArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
