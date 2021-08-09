require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it 'uniq_universities' do
      doctor4 = @hospital1.doctors.create!(name: 'Adam Lambert', specialty: 'Oncology', university: 'John Hopkins University')

      expect(@hospital1.uniq_universities.length).to eq(2)
    end
  end
end
