# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Subject.create([
  {
    name: 'Limba străină',
    genre: 'b',
    start_year: 2
  },
  {
    name: 'Limba română',
  },
  {
    name: 'Matematica',
  },
  {
    name: 'Limba franceză',
    genre: 'f',
    start_year: 2
  },
  {
    name: 'Limba engleză',
    genre: 'f',
    start_year: 2
  },
  {
    name: 'Muzica',
    finish_year: 9
  },
  {
    name: 'Științele naturii',
    finish_year: 5
  },
  {
    name: 'Educația fizică'
  },
  {
    name: 'Fizica',
    start_year: 6
  },
  {
    name: 'Chimia',
    start_year: 7
  },
  {
    name: 'Informatica',
    start_year: 7
  },
  {
    name: 'Istoria',
    start_year: 4
  },
  {
    name: 'Educația civică',
    start_year: 5
  }
])

