# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'
Country.destroy_all
City.destroy_all
User.destroy_all
Parking.destroy_all
Rental.destroy_all
Review.destroy_all

chile = Country.create!(name: "Chile")
argentina = Country.create!(name: "Argentina")
venezuela = Country.create!(name: "Venezuela")

santiago = City.create!(name: "Santiago", country_id: chile.id)
bsas = City.create!(name: "Buenos Aires", country_id: argentina.id)
caracas = City.create!(name: "Caracas", country_id: venezuela.id)

enrique = User.create!(email: "enrique.altamiros@gmail.com",
                       password: "1234567",
                       first_name: "Enrique",
                       last_name: "Altamirano",
                       phone: "1234567",
                       address: "puntaarenas123",
                       city_id: santiago.id)

edgard = User.create!(email: "ecardenas@uc.cl",
                      password: "1234567",
                      first_name: "Edgard",
                      last_name: "Cardenas",
                      phone: "1234567",
                      address: "caracas123",
                      city_id: caracas.id)

kevin = User.create!(email: "kemack83@gmail.com",
                     password: "1234567",
                     first_name: "Kevin",
                     last_name: "Mackinlay",
                     phone: "1234567",
                     address: "viedma123",
                     city_id: bsas.id)

parking_providencia = Parking.create!(name: "Parking Providencia",
                                      address: "providencia 01222",
                                      price_per_day: 30.0,
                                      description: "hermoso parking bien iluminado",
                                      covered: true,
                                      vehicle_type: "Suv",
                                      city_id: santiago.id,
                                      user_id: enrique.id,
                                      rented: true)

Parking.create!(name: "Parking caracas centro",
                address: "caracas 01222",
                price_per_day: 40.0,
                description: "Parking en pleno centro de la ciudad",
                covered: false,
                vehicle_type: "Camioneta",
                city_id: caracas.id,
                user_id: edgard.id,
                rented: false)

parking_palermo = Parking.create!(name: "Parking en Palermo Village",
                                  address: "Palermo 122",
                                  price_per_day: 60.0,
                                  description: "Parking de lujo",
                                  covered: true,
                                  vehicle_type: "Deportivo",
                                  city_id: bsas.id,
                                  user_id: kevin.id,
                                  rented: false)

Rental.create(start_date: Date.today,
              end_date: Date.today + 10.day,
              total_amount: parking_palermo.price_per_day * 10,
              user_id: kevin.id,
              parking_id: parking_palermo.id)

Review.create(comment: "Este espacio es muy central",
              rating: 4.8,
              user_id: edgard.id,
              parking_id: parking_palermo.id)

Review.create(comment: "Este espacio es muy seguro y accesible",
              rating: 4.7,
              user_id: kevin.id,
              parking_id: parking_providencia.id)
