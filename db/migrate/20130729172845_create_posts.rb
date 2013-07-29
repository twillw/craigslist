class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.decimal :price
      t.string :location

      t.timestamps
    end
  end
end
