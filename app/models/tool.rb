class Tool < ActiveRecord::Base
  validates :name, presence: true
  validates :user, presence: true
  validates :category, presence: true

  belongs_to :user
  belongs_to :category

  def formatted_price
    price / 100.0
  end

end
