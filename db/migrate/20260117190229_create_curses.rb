class CreateCurses < ActiveRecord::Migration[8.1]
  def change
    create_table :curses do |t|
      t.string :title, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :apply_url, null: false
      t.integer :curse_type, null: false, default: 0, null: false

      t.timestamps
    end
    add_index :curses, :title
  end
end
