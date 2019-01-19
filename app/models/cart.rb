class Cart < ApplicationRecord
  has_many :products
  validates :name, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false}
  validates :total, presence: true
end
