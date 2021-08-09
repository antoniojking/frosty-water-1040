require 'rails_helper'

RSpec.describe 'Doctors Show Page' do
  # As a visitor
  # When I visit a doctor's show page
  # I see all of that doctor's information including:
  #  - name
  #  - specialty
  #  - university where they got their doctorate
  # And I see the name of the hospital where this doctor works
  # And I see the names of all of the patients this doctor has
  it 'displays doctor along with all their attributes' do
    visit "/doctors/#{@doctor1.id}"

    expect(page).to have_content(@doctor1.name)
    expect(page).to have_content(@doctor1.specialty)
    expect(page).to have_content(@doctor1.university)

    expect(page).to_not have_content(@doctor2.name)
    expect(page).to_not have_content(@doctor2.specialty)
    expect(page).to_not have_content(@doctor2.university)
  end

  it 'lists name of the hospital where doctor works' do
    visit "/doctors/#{@doctor1.id}"

    expect(page).to have_content(@hospital1.name)

    expect(page).to_not have_content(@hospital2.name)
  end

  it 'lists name of all patients this doctor has' do
    visit "/doctors/#{@doctor1.id}"

    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)

    expect(page).to_not have_content(@patient3.name)
  end

  # As a visitor
  # When I visit a Doctor's show page
  # Next to each patient's name, I see a button to remove that patient from that doctor's caseload
  # When I click that button for one patient
  # I'm brought back to the Doctor's show page
  # And I no longer see that patient's name listed
  it 'has a button to remove patient from caseload' do
    visit "/doctors/#{@doctor1.id}"

    expect(page).to have_button("Remove #{@patient1.name}")
    expect(page).to have_button("Remove #{@patient2.name}")
  end

  it 'can remove patient from caseload' do
    visit "/doctors/#{@doctor1.id}"

    click_button("Remove #{@patient2.name}")
    
    expect(page).to have_content(@patient1.name)

    expect(page).to_not have_content(@patient2.name)
  end
end
