require 'rails_helper'

RSpec.describe 'Application new form page' do
  it 'has a form to create a new applicant' do
    sam = Application.create!(applicant_name: "Sam Neill",
                              address: "123 Wilderpeople Way",
                              city: "Eerie",
                              state: "Colorado",
                              zip_code: 80514,
                              reason: "Lots of love to give",
                              status: "In Progress")
    steve = Application.create!(applicant_name: "Steve Irwin",
                              address: "333 Wallaby Blvd",
                              city: "Orlando",
                              state: "Florida",
                              zip_code: 32789,
                              reason: "Crikey",
                              status: "In Progress")

    visit "/applications"

    click_link "Start an Application"

    expect(current_path).to eq("/applications/new")

    fill_in :applicant_name, with: "Steve Irwin"
    fill_in :address, with: "333 Wallaby Blvd"
    fill_in :city, with: "Orlando"
    fill_in :state, with: "Florida"
    fill_in :zip_code, with: 32789
    fill_in :reason, with: "Crikey"
    fill_in :status, with: "In Progress"

    click_button "Submit"

    expect(current_path).to eq("/applications/#{Application.all.last.id}")
    expect(page).to have_content("Steve Irwin")
    expect(page).to_not have_content("Sam Neill")
    expect(page).to have_content("333 Wallaby Blvd")
    expect(page).to have_content("Orlando")
    expect(page).to have_content("Florida")
    expect(page).to have_content(32789)
    expect(page).to have_content("Crikey")
    expect(page).to have_content("In Progress")
  end

  it "redirects to form if given invalid data" do
    steve = Application.create!(applicant_name: "Steve Irwin",
                              address: "333 Wallaby Blvd",
                              city: "Orlando",
                              state: "Florida",
                              zip_code: 32789,
                              reason: "Crikey",
                              status: "In Progress")
    visit "/applications/new"


    expect(current_path).to eq("/applications/new")
    fill_in :applicant_name, with: 'Steve Irwin'
    click_button "Submit"

    expect(page).to have_content("Error: Fields can not be left blank")
    expect(page).to have_current_path("/applications/new")

  end
end
