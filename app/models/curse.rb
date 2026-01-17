class Curse < ApplicationRecord
  has_rich_text :about
  has_one_attached :cover
end
