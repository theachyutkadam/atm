class Transfer < ActiveRecord::Base
  belongs_to :customer
  belongs_to :bank
  belongs_to :atm
  # validates :atm_no, presence: true, length: { minimum: 4 }
  # validates :atm_pin, presence: true, length: { minimum: 16 }
  # validates :receiver_atm_no, presence: true, length: { minimum: 16 }
  validates :balance, presence: true
end
