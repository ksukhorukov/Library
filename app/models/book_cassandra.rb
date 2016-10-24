class BookCassandra
	include Cequel::Record

	key :id, :uuid
	column :author, :text
	column :title, :text
	column :genre, :text
	column :price, :text
	column :publish_date, :text
	column :description, :text

  end