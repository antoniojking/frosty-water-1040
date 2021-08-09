require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  # As a visitor
  # When I visit the patient index page
  # I see the names of all patients listed from oldest to youngest
  it 'displays names of all patients in descending order' do
    visit "/patients"
    
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient3.name)
    expect(@patient2.name).to appear_before(@patient3.name)
    expect(@patient3.name).to appear_before(@patient1.name)
  end
end
