require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
user = JSON.parse(movie_serialized)
user["results"].each do |result|
  movie = Movie.new(
    title: result['original_title'],
    overview: result['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{result['poster_path']}",
    rating: result['vote_average']
  )
  movie.save
end

List.create(name: 'Drama')
List.create(name: 'Action')
List.create(name: 'Horror')
