class Like < ActiveRecord::Base
attr_accessible :user_id,:book_id,:is_like 
  belongs_to :user
	belongs_to :book

end
