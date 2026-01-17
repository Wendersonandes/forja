class CreateCurses < ActiveRecord::Migration[8.1]
  def change
    create_table :curses do |t|
      t.string :title
      t.datetime :start_date
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
    add_index :curses, :title
  end
end
