class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots, {:id => false }  do |t|
      t.integer :id
      t.timestamps
    end
    execute "ALTER TABLE slots ADD PRIMARY KEY (id);"
  end
end

