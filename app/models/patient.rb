class Patient < ApplicationRecord
  has_many :treatments
  has_many :doctors, through: :treatments
end
