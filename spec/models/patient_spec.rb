require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:treatments) }
    it { should have_many(:doctors).through(:treatments) }
  end

  describe 'class method' do
    it 'desc_order' do
      expect(Patient.desc_order.count).to eq(3)
      expect(Patient.desc_order.first).to eq(@patient2.name)
      expect(Patient.desc_order.last).to eq(@patient1.name)
    end
  end
end
