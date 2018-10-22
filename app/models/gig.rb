class Gig < ApplicationRecord
    #devise :database_authenticatable, :registerable,
     #    :recoverable, :rememberable, :trackable, :validatable

  scope :year, -> (year) { where year: year }
  scope :month, -> (month) { where month: month }
end
