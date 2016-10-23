class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
    	t.belongs_to :slot
    	t.string :author
        t.string :title
    	t.string :genre
    	t.float :price
    	t.string :publish_date
    	t.string :description
    	t.timestamps
    end
  end
end
