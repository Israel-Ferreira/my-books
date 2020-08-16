class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  belongs_to :publisher

  validates :title, :isbn, :launch_year, presence: true 
end
