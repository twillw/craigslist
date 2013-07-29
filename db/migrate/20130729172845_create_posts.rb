class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.decimal :price, precision: 8, scale: 2
      t.string :location

      t.timestamps
    end
  end
end
