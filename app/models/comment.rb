class Comment < ApplicationRecord
  belongs_to :list
  validates :content, presence: true
end
