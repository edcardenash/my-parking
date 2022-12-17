require 'open-uri'
VEHICULOS = %w[Automovil Camioneta Motocicleta Bicicleta]
puts "Estamos borrando todo"
Country.destroy_all
User.destroy_all
City.destroy_all
Parking.destroy_all
Rental.destroy_all
Review.destroy_all

puts "Estamos creando datos para la DB"
chile = Country.create!(name: "Chile")
argentina = Country.create!(name: "Argentina")
venezuela = Country.create!(name: "Venezuela")

santiago = City.create!(name: "Santiago", country_id: chile.id)
bsas = City.create!(name: "Buenos Aires", country_id: argentina.id)
caracas = City.create!(name: "Caracas", country_id: venezuela.id)

User.create!(email: "enrique.altamiros@gmail.com",
             password: "1234567",
             first_name: "Enrique",
             last_name: "Altamirano",
             phone: "1234567",
             address: "puntaarenas123",
             city_id: santiago.id)

User.create!(email: "ecardenas@uc.cl",
             password: "1234567",
             first_name: "Edgar",
             last_name: "Cardenas",
             phone: "1234567",
             address: "caracas123",
             city_id: caracas.id)

User.create!(email: "kemack83@gmail.com",
             password: "1234567",
             first_name: "Kevin",
             last_name: "Mackinlay",
             phone: "1234567",
             address: "viedma123",
             city_id: bsas.id)

parking = Parking.create!(name: "Puesto de estacionamiento en Providencia",
                          address: "Manuel Montt 2145, Santiago",
                          price_per_day: 3000.0,
                          description: "Puesto de estacionamiento ubicado cerca de estación de metro Manuel Montt, descubierto en condominio privado.",
                          covered: false,
                          vehicle_type: "Automovil",
                          city_id: 1,
                          user_id: 2,
                          rented: false)
parking.photo.attach(io: URI.open("https://res.cloudinary.com/dpobz3mzq/image/upload/v1/development/maukj3zv8tsiomymo5k3j8td83vv"), filename: 'montt.jpg')
parking.save
parking = Parking.create!(name: "Parking para autos eléctricos",
                          address: "Av. Vitacura 777, Santiago",
                          price_per_day: 8000.0,
                          description: "Parking en pleno sector financiero para auto eléctrico, carga incluida en el precio.",
                          covered: false,
                          vehicle_type: "Automovil",
                          city_id: 1,
                          user_id: 2,
                          rented: false)
parking.photo.attach(io: URI.open("https://res.cloudinary.com/dpobz3mzq/image/upload/v1/development/x79b0n1vcagpjew7b94qcyenp5zw"), filename: 'electrico.jpg')
parking.save
parking = Parking.create!(name: "Estacionamiento Chacao",
                          address: "Av. Andrés Bello 213, Caracas",
                          price_per_day: 4000.0,
                          description: "Estacionamiento en Avenida Andrés Bello, en edificio residencial, cubierto",
                          covered: true,
                          vehicle_type: "Automovil",
                          city_id: 3,
                          user_id: 1,
                          rented: true)
parking.photo.attach(io: URI.open("https://res.cloudinary.com/dpobz3mzq/image/upload/v1/development/xszrdw91wg143e7ycbytl1nzcqe9"), filename: 'chacao.jpg')
parking.save
parking = Parking.create!(name: "Parking espacioso",
                          address: "Corrientes 4884, Buenos Aires",
                          price_per_day: 3500.0,
                          description: "Parking ideal para camionetas.",
                          covered: false,
                          vehicle_type: "Camioneta",
                          city_id: 2,
                          user_id: 3,
                          rented: false)
parking.photo.attach(io: URI.open("https://res.cloudinary.com/dpobz3mzq/image/upload/v1/development/5poa3zqpstmq124jrgqcfoaktv5m"), filename: 'espacioso.jpg')
parking.save
parking = Parking.create!(name: "Estacionamiento para motocicleta",
                          address: "Av. Francisco de Miranda 763, Caracas",
                          price_per_day: 2000.0,
                          description: "Estacionamiento para motocicleta a nivel de calle.",
                          covered: false,
                          vehicle_type: "Motocicleta",
                          city_id: 3,
                          user_id: 1,
                          rented: false)
parking.photo.attach(io: URI.open("https://res.cloudinary.com/dpobz3mzq/image/upload/v1/development/rsaiz7yil7j2dl6fm01zstcev2hc"), filename: 'moto.jpg')
parking.save
parking = Parking.create!(name: "Parking divertido",
                          address: "Av. Pres. Figueroa Alcorta 5200, Buenos Aires",
                          price_per_day: 1500.0,
                          description: "Estacionamiento colorido en lote de estacionamiento.",
                          covered: false,
                          vehicle_type: "Automovil",
                          city_id: 2,
                          user_id: 3,
                          rented: false)
parking.photo.attach(io: URI.open("https://res.cloudinary.com/dpobz3mzq/image/upload/v1/development/w3mjq0cfpcvzglupsiqiv7nqxmma"), filename: 'divertido.jpg')
parking.save

rental = Rental.create!(start_date: Time.now, end_date: Time.now + 1.hour, total_amount: 500.0, user_id: 1, parking_id: 3)
rental.save
puts "¡Listo!"
