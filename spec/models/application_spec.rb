require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:pets_applications)}
    it { should have_many(:pets).through(:pets_applications)}
  end

  describe 'validations' do
    it { should validate_presence_of(:applicant_name)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:zip_code)}
  end

  describe 'Class Methods' do
    it '.update_status' do
      shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      shelter_2 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      sam = Application.create!(applicant_name: "Sam Neill",
                                address: "123 Wilderpeople Way",
                                city: "Eerie",
                                state: "Colorado",
                                zip_code: 80514,
                                reason: "Lots of love to give",
                                status: "Pending")
      pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)
      pet_2 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Rock', shelter_id: shelter.id)
      pet_3 = Pet.create!(adoptable: true, age: 2, breed: 'Great Dane', name: 'Scooby', shelter_id: shelter.id)

      expect(sam.status).to eq("Pending")
    end
  end
end
