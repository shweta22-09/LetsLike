class User < ActiveRecord::Base
attr_accessible :title
	has_many :likes
  has_many :books, :through => :likes
	
end
