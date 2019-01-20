#      ssstevenstapleton@gmail.com
#      Cart Product Model
#      Purpose: Assign association for join table

class CartsProduct < ApplicationRecord
  has_many :products
  belongs_to :cart
end
