#      ssstevenstapleton@gmail.com
#      Cart Model
#      Purpose: Validate cart attributes and assigns association

class Cart < ApplicationRecord
  has_one :cart_product
  validates :name, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false}
  validates :total, presence: true
end
