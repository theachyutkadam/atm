class Atm < ActiveRecord::Base
  belongs_to :bank
  validates :location, presence: true
end
