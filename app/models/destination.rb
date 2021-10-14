class Destination < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :users, through: :ratings

  validates :name, presence: true
  validate :not_duplicate

  #scope :order_by_rating, -> {left_joins:(:ratings).group(:id).order('avg(scale) desc')}

  def not_duplicate
    destination = Destination.find_by(name: name)
    if !!destination && destination != self
      errors.add(:name, 'has already been added')
    end
  end

end
