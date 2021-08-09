require 'rails_helper'

RSpec.describe 'Hospitals Show Page' do
  # As a visitor
  # When I visit a hospital's show page
  # I see the hospital's name
  # And I see the number of doctors that work at this hospital
  # And I see a unique list of universities that this hospital's doctors attended
  it 'displays hospital name' do
    visit "/hospitals/#{@hospital1.id}"

    expect(page).to have_content(@hospital1.name)

    expect(page).to_not have_content(@hospital2.name)
  end

  xit 'displays the number of doctors working at that hospital' do
    visit "/hospitals/#{@hospital1.id}"

    expect(page).to have_content("Number of Doctors: #{@hospital1.doctors.length}")
  end

  xit 'displays a list of universities associated with doctors working at that hospital' do
    visit "/hospitals/#{@hospital1.id}"

    expect(page).to have_content(@doctor1.university)
    expect(page).to have_content(@doctor3.university)

    expect(page).to_not have_content(@doctor2.university)
  end
end
