# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [{ email: "crdsis@gmail.com", first_name: "Cristopher", last_name: "Huaroc", phone_number: "965547415",
           document_number: "70025447", password: "123456" },

         { email: "carlos@gmail.com", first_name: "Carlos", last_name: "Alva", phone_number: "963321547",
           document_number: "70545474", password: "123456" },

         { email: "horlando@gmail.com", first_name: "Horlando", last_name: "Cespedes", phone_number: "961214715",
           document_number: "70547847", password: "123456" },

         { email: "andres123@gmail.com", first_name: "Andres", last_name: "Muñoz", phone_number: "965554789",
           document_number: "70074125", password: "123456" }]

agencies = [{ id: '1', name: "palpa SAC", email: "crdsis@gmail.com", tax_number: "20321247854",
              address: "Francisco Bolognesi 367, Nasca 11401", state: "Nazca", country: "Perú", user_id: "1" },
            { id: '2', name: "InkaTour", email: "crdsis@gmail.com", tax_number: "20321456842",
              address: "Pza. Plaza San Francisco #138", state: "Cusco", country: "Perú", user_id: "2" },
            { id: '3', name: "Ica tour SAC", email: "andres123@gmail.com", tax_number: "20321458987",
              address: "Av. Grau Nº 148", state: "Ica", country: "Perú", user_id: "3" }]

tours = [{ price: 110.00, destination: "Nazca",
           title_tour: "Lineas de Nazca y Palpa - Tour Terrestre",
           description: "Es cierto que la mejor forma de ver las famosas Líneas de Nazca es sobrevolándolas,
           pero aquí te presentamos una nueva alternativa para conocer estos inmensos geoglifos gravados
           en el desierto por la civilización Nazca.", duration: "3 horas", agency_id: 1 },
         { price: 350.00, destination: "Cusco",
           title_tour: "Excursión de un día a Machu Picchu desde Cusco (InkaTours)",
           description: "Machu Picchu Day Trip te permite experimentar la espectacular
            Ciudadela de Machu Picchu en solo un día con un guía local.
            En nuestro servicio de confort Excursión de un día a Machu Picchu desde Cusco,
            verá la impresionante Ciudad de las Nubes de MachuPicchu con boletos de tren
            de ida y vuelta desde Cusco.", duration: "3 días, 4 noches", agency_id: 2 },
         { price: 170.00, destination: "Ica",
           title_tour: "Full Day Completo Ica",
           description: "Visita guiada a los maravillosos atractivos de Ica & Paracas.
           Excursión en Botes Deslizadores donde observaremos la mayor cantidad de aves y lobos marinos que
           habitan en las Islas Ballestas. Tour en la laguna de La Huacachina. Tour Ruta del Pisco en Ica - donde
           haremos Cata de la variedad de Piscos y Vinos de la Región. Tour en el desierto de Ica a bordo de los
           Buggies y practicaremos el sandboarding por las dunas.", duration: "1 día", agency_id: 3 }]

puts '------------Users------------'

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name} - #{user.email}"
end

puts '------------Tours------------'

tours.each do |attributes|
  tour = Tour.create!(attributes)
  puts "Created #{tour.destination} - #{tour.description}"
end

puts '------------Agencies------------'

agencies.each do |attributes|
  agency = Agency.create!(attributes)
  puts "Created #{agency.name} - #{agency.tax_number}"
end

puts 'Finished!'
