class Book < ActiveRecord::Base
attr_accessible :title,:choosed,:isbn_id 
	has_many :likes
  has_many :users, :through => :likes
end
