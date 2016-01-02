# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

map = Map.create(name: 'SP')

City.create([
  { name: 'A', map: map},
  { name: 'B', map: map },
  { name: 'C', map: map },
  { name: 'D', map: map },
  { name: 'E', map: map }
])

Route.create([
  { origin: City.by_name("A"), destination: City.by_name("B"), distance: 10 },
  { origin: City.by_name("B"), destination: City.by_name("D"), distance: 15 },
  { origin: City.by_name("A"), destination: City.by_name("C"), distance: 20 },
  { origin: City.by_name("C"), destination: City.by_name("D"), distance: 30 },
  { origin: City.by_name("B"), destination: City.by_name("E"), distance: 50 },
  { origin: City.by_name("D"), destination: City.by_name("E"), distance: 30 }
])