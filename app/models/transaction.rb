class Transaction < ActiveRecord::Base
  belongs_to :customer
  belongs_to :bank
  belongs_to :atm

  validates :transaction_type, presence: true
  validates :balance, presence: true
end
