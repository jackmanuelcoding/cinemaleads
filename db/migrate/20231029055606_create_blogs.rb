class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
