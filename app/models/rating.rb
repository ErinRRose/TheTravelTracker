class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :note, presence: true
  validates :scale, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :destination, uniqueness: {scope: :user, message: "has already been rated by you" }
end
