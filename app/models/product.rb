class Product < ApplicationRecord
  belongs_to :cart
  before_save :downcase_name
  validates :name, presence: true, length: {maximum: 15}, uniqueness: {case_sensitive: false}
  validates :price, presence: true, length: {maximum: 15}
  validates :price, presence: true, numericality: {only_float: true, greater_than: 0, less_than: 10000}
  validates :inventory, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 10000}

  private
    def downcase_name
      self.name = name.downcase
    end
end
