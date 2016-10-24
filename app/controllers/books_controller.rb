class BooksController < ApplicationController

	def show
		@book = Book.find_by_id(params[:id])
	end

end
