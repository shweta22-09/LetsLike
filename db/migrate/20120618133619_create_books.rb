class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
			t.integer :isbn_id , :limit=>8
      t.timestamps
    end
  end
end
