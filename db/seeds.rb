# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rs1 = RailwayStation.first(id:1, title: 'Omsk')
rs2 = RailwayStation.new(id: 2, title: 'Moscow')
t1 = Train.new(number: '123')
r1 = Route.new(name: 'Omsk - Moscow')
r1.railway_stations << rs1
r1.railway_stations << rs2
t1.current_station << rs1
