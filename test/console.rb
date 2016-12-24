user1 = User.create(name: 'Dmitry')
ticket1 = Ticket.create(number: 123)
ticket1.user = user1

train1 = Train.create(number: 587)

station1 = RailwayStation.create(title: 'Moscow')
station2 = RailwayStation.create(title: 'Omsk')


ticket1.start_station = station1
ticket1.end_station = station2

train1.current_station = RailwayStation.first
train1.tickets << ticket1
