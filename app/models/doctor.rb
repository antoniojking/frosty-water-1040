class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :treatments
  has_many :patients, through: :treatments
end
