class Author < ApplicationRecord
  validates :author_name, :country, presence: true 
  has_rich_text :biography

  has_many :books 

  paginates_per 5
end
