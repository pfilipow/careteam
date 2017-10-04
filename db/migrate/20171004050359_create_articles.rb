class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.belongs_to :blog, foreign_key: true
      t.text :title
      t.text :content
      t.integer :author_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
