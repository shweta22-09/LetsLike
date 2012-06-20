class ChangeColumnInLike < ActiveRecord::Migration
  def up
		change_column :likes, :is_like, :boolean, :default => true
  end

  def down
  end
end
