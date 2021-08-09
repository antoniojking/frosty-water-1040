class Hospital < ApplicationRecord
  has_many :doctors

  def uniq_universities
    self.doctors.select(:university).distinct
  end
end
