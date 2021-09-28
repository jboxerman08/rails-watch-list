require 'json'
require 'open-uri'

module TheMovieDBService
  def self.get_movie id
    url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['IMDB_API_KEY']}"
    movie_serialized = URI.open(url).read
    movie = JSON.parse(movie_serialized, {symbolize_names: true})
  end

  def self.create_movie movie
    Movie.create(title: movie[:title], overview: movie[:overview], poster_url: movie[:poster_path], rating: movie[:vote_average])
  end

  def self.popular_movies
    url = "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['IMDB_API_KEY']}"
    movies_serialized = URI.open(url).read
    popular_movies = JSON.parse(movies_serialized, {symbolize_names: true})[:results]
  end
end
