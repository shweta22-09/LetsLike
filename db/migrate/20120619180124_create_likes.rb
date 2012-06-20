class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
		count = 0
		t.integer :book_id
		t.integer :user_id
		t.integer :likes ,:default => count, :null => false

      t.timestamps
    end
  end
end
