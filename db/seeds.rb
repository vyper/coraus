# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { email: 'vyper@maneh.org', password: '123456' }
])

Talker.create([
  { name: 'Leonardo Saraiva',  email: 'leonardo@coraus.com.br', phone: '(41) 9931-8908', forecast_at: 5.days.from_now },
  { name: 'Leandro Citelli',   email: 'leandro@coraus.com.br',  phone: '(41) 9648-6486', forecast_at: 6.days.from_now },
  { name: 'Kleiton Koslovski', email: 'kleiton@coraus.com.br',  phone: '(41) 9135-3232', forecast_at: 7.days.from_now },
])

Listener.create([
  { name: 'Roger Waters',   email: 'roger@coraus.com.br', phone: '448999999991' },
  { name: 'David Gilmour',  email: 'david@coraus.com.br', phone: '448999999992' },
  { name: 'Nick Mason',     email: 'nick@coraus.com.br',  phone: '448999999993' },
  { name: 'Richard Wright', email: 'rick@coraus.com.br',  phone: '448999999994' },
  { name: 'Syd Barret',     email: 'syd@coraus.com.br',   phone: '448999999995' },
])
