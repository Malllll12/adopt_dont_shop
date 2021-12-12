require 'rails_helper'

RSpec.describe 'Application index page', type: :feature do
# And I see my Name, address information, and description of why I would make a good home
# And I see an indicator that this application is "In Progress"
  it 'links to a new application form' do
    visit "/applications"

    click_link "Start an Application"

    expect(current_path).to eq("/applications/new")
  end
end
