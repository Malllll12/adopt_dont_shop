require 'rails_helper'

RSpec.describe 'Application index page', type: :feature do
  it 'links to a new application form' do
    visit "/applications"

    click_link "Start an Application"

    expect(current_path).to eq("/applications/new")
  end
end
