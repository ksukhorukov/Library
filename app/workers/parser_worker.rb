class ParserWorker
	include Sidekiq::Worker 

	def perform
		files = Dir.glob('data/*.xml')
		files.each do |file_name|
			puts file_name
			doc = File.open(file_name) { |f| Nokogiri::XML(f) }
			doc.css('book').each do |book|
				book_id =  book.attribute('id').value
				slot_id = book_id.match(/bk([0-9]+)/)[1]
				book_author = book.at_css('author').content.strip
				book_title = book.at_css('title').content.strip
				book_genre = book.at_css('genre').content.strip
				book_price = book.at_css('price').content.strip
				book_publish_date = book.at_css('publish_date').content.strip
				book_description = book.at_css('description').content.strip

				slot = Slot.find_by_id(slot_id)
				Slot.create(:id => slot_id) unless(slot)

				book = Book.where(:author => book_author,
								  :title => book_title,
								  :genre => book_genre,
								  :price => book_price,
								  :publish_date => book_publish_date,
								  :description => book_description)
				if book.empty?
					Book.create(:slot_id => slot_id, 
						:author => book_author, 
						:title => book_title, 
						:genre => book_genre,
						:price => book_price,
						:publish_date => book_publish_date,
						:description => book_description )
				end
					
				BookCassandra.all.each do |book|
					book.destroy
				end

				Slot.all.each do |slot|
					latest = slot.books.sort_by(&:created_at).last
					BookCassandra.create(
							:id => slot.id,
							:author => latest.author,
							:title => latest.title,
							:genre => latest.genre,
							:price => latest.price,
							:publish_date => latest.publish_date,
							:description => latest.description
						)
				end

			end
		end
	end
end