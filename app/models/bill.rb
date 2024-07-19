class Bill < ApplicationRecord
  belongs_to :employee
  enum bill_type: {food: 'Food',travel: 'Travel', others: 'Others'}
  validates :amount, presence: true
  validates :bill_type, presence: true
end
