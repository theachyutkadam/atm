class Bank < ActiveRecord::Base
	has_many :atms
	has_many :customers
	validates :name, presence: true
	validates :branch, presence: true
end
