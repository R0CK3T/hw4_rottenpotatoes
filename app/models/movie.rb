class Movie < ActiveRecord::Base

class InvalidKeyError < StandardError ; end


  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.all_movies_by_same_director(movie)
    movies = self.find_all_by_director(movie.director)
  end
end
