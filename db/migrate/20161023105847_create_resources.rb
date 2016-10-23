class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :fname
      t.datetime :mtime
      t.timestamps
    end
  end
end
