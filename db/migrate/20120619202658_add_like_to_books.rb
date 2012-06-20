class AddLikeToBooks < ActiveRecord::Migration
  def change
		count = 0
		change_column :books, :choosed, :integer, :default => count
  end
end
