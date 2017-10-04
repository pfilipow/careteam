class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :domain
      t.text :title
      t.text :description
      t.integer :owner_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
