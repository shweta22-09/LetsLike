class UsersController < ApplicationController
before_filter :islogin  ,:except=>[:load,:index,:new, :create]
#load book data from openlibrary
	def load
		@books = Book.all
		details = Openlibrary::Data
		@books.each do |b|
			id= b.isbn_id
			book_detail = details.find_by_isbn(id)
			name = book_detail.title
			b.title = name
			b.save
			end
	end

	def index
		@books = Book.paginate(:page => params[:page],:per_page => 10)
	end

	def new
		@user = User.new
	end

	def create
		user = User.create(params[:user])
			if user.save
				session[:user_id]=user.id
				redirect_to users_path
			else
				render :action=>"new"
			end
	end

#for recommended books
	def like
		book = Book.find(params[:id])
		like  = book.likes.create(:user_id=>session[:user_id]) if session[:user_id]
			count = book.choosed
			book.choosed = count+1
			book.save

  		 if session[:return_to]
		    redirect_to session[:return_to]
				end
				
	end

#logout
	def destroy
	    reset_session
			redirect_to users_path
	end

end
