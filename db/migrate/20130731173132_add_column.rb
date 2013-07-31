class AddColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :subcategory_id, :integer
  end
end
