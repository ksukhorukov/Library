class CassandraController < ApplicationController
	def index
		@books = BookCassandra.all
	end
end
