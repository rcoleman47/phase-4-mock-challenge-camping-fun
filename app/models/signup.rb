class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  #the {in: 0..23} would not work
  validates :time, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 23 }
  validates :activity, presence: true
  validates :camper, presence: true
end
