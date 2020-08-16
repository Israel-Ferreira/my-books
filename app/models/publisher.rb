class Publisher < ApplicationRecord
  validates :title, presence: true
  has_rich_text :description
end
