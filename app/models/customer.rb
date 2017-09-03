class Customer < ActiveRecord::Base
  belongs_to :bank
  validates :name, presence: true
  validates :mobile, presence: true, length: { minimum: 10 }
  validates :atm_pin, presence: true, length: { minimum: 4 }
  validates :atm_no, presence: true, length: { minimum: 16 }
  validates :balance, presence: true
end
