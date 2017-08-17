class Transaction < ActiveRecord::Base
  belongs_to :customer
  belongs_to :bank
  belongs_to :atm
end
