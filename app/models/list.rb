class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :thumbnail

  validates :name, uniqueness: true, presence: true
end
