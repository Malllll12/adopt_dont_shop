require 'rails_helper'

RSpec.describe 'Application index page', type: :feature do
# As a visitor
# When I visit the pet index page
# Then I see a link to "Start an Application"
# When I click this link
# Then I am taken to the new application page where I see a form
# When I fill in this form with my:
#   - Name
#   - Street Address
#   - City
#   - State
#   - Zip Code
# And I click submit
# Then I am taken to the new application's show page
# And I see my Name, address information, and description of why I would make a good home
# And I see an indicator that this application is "In Progress"
  it 'links to a new application form' do
    visit "/applications"

    click_link "Start an Application"

    expect(current_path).to eq("/applications/new")
  end
end
