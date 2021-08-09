require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:treatments) }
    it { should have_many(:doctors).through(:treatments) }
  end
end
