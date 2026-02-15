class Course < ApplicationRecord
  has_rich_text :about
  has_one_attached :cover
  enum :course_type, { practical: 0, theoretical: 1 }

  validates :title, :address, :apply_url, :city, :course_type, :start_date, :end_date, :state, presence: true
end
