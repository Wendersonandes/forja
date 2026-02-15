class Course < ApplicationRecord
  has_rich_text :about
  has_one_attached :cover
  enum :course_type, { practical: 0, theoretical: 1 }

  SKILLS = %w[Pintura Gravura Fotografia Desenho Escultura Cerâmica Ilustração Graffiti]

  validates :title, :about, :address, :apply_url, :city, :course_type, :start_date, :end_date, :state, :skill_list, presence: true

  acts_as_taggable_on :tags, :skills
end
