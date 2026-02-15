class CreateCourses < ActiveRecord::Migration[8.1]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :apply_url, null: false
      t.integer :course_type, null: false, default: 0, null: false

      t.timestamps
    end
    add_index :courses, :title
  end
end
