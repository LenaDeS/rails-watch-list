# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
require 'json'
require 'open-uri'

puts "Deleting previous data"
Bookmark.destroy_all
Movie.destroy_all

puts "All movies have been destroyed"

puts "creating seeds"

url = "https://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
data = JSON.parse(response)
data["results"].each do |movie|
  poster_path = movie["poster_path"]
  movie = Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{poster_path}" ,
    rating: movie["vote_average"]
  )
  puts "Movie : #{movie.title} has been created"
end



List.create(name: "Comedy")
List.create(name: "Series")
List.create(name: "Romantic")
