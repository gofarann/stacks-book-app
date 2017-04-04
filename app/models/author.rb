class Author < ApplicationRecord
  # PUT SOMETHING HERE NOW K THX
  has_many :books

  validates :name, presence: true
  validates :name, uniqueness: true
end
