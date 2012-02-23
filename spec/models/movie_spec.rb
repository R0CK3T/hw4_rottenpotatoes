require 'spec_helper'



describe Movie do


  describe 'searching Tmdb by keyword' do
    before(:each) do 
      @fake_results = [mock('Movie'), mock('Movie')]
      @fake_result = mock('Movie')
      @fake_director = mock('String')
    end
    
    it 'should call all_movies_by_same_director with given valid ID' do

      Movie.should_receive(:find).with("id").and_return(@fake_result)
      @fake_result.stub(:director).and_return(@fake_director)
      Movie.should_receive(:find_all_by_director).with(@fake_director).and_return(@fake_results)
      
      Movie.all_movies_by_same_director("id")
    end
    

    it 'should raise an InvalidIdError with no ID' do
      Movie.stub(:find).with("id").and_return('')
      lambda { Movie.all_movies_by_same_director("id") }.
        should raise_error(Movie::InvalidKeyError)
    end
    
=begin
    it 'should raise an InvalidKeyError with invalid API key' do
      TmdbMovie.stub(:find).
        and_raise(RuntimeError.new('API returned code 404'))
      lambda { Movie.find_in_tmdb('Inception') }.
        should raise_error(Movie::InvalidKeyError)
    end
=end
  end
end



