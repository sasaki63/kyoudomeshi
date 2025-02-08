class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  # validates :rate, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
