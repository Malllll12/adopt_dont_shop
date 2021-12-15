# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@shelter = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
@shelter_2 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
@sam = Application.create!(applicant_name: "Sam Neill",
                          address: "123 Wilderpeople Way",
                          city: "Eerie",
                          state: "Colorado",
                          zip_code: 80514,
                          reason: "Lots of love to give",
                          status: "In Progress")
@steve = Application.create!(applicant_name: "Steve Irwin",
                             address: "333 Wallaby Blvd",
                             city: "Orlando",
                             state: "Florida",
                             zip_code: 32789,
                             reason: "Crikey",
                             status: "In Progress")
@pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
@pet_2 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Rock', shelter_id: @shelter.id)
@pet_3 = Pet.create!(adoptable: true, age: 2, breed: 'Great Dane', name: 'Scooby', shelter_id: @shelter.id)
@pet_4 = Pet.create!(adoptable: true, age: 1, breed: 'Pit Bull', name: 'RoccO', shelter_id: @shelter.id)
@pet_5 = Pet.create!(adoptable: true, age: 1, breed: 'Labrador', name: 'ROCK', shelter_id: @shelter.id)
@pet_6 = Pet.create!(adoptable: true, age: 2, breed: 'Basset Hound', name: 'Rocky', shelter_id: @shelter.id)
