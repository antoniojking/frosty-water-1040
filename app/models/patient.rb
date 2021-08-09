class Patient < ApplicationRecord
  has_many :treatments
  has_many :doctors, through: :treatments

  def self.desc_order
    order(age: :desc)
  end
end
