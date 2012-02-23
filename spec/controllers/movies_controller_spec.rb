require 'spec_helper'

describe MoviesController do


  describe 'Search Movies by Director' do
    before(:each) do 
      @fake_results = [mock('Movie'), mock('Movie')]
    end
    it 'should search for movies with the same director' do 
      Movie.should_receive(:all_movies_by_same_director).with("id").and_return(@fake_results)
      get :search_director , {:id => "id"}  
    end
    it 'should select the Search Results template for rendering' do
      Movie.should_receive(:all_movies_by_same_director).with("id").and_return(@fake_results)
      get :search_director, {:id => "id"}  
      response.should render_template('search_director')
    end
    it 'should make the search_director results available to that template' do
      Movie.should_receive(:all_movies_by_same_director).with("id").and_return(@fake_results)
      get :search_director, {:id => "id"}  
      assigns(:movies).should == @fake_results
    end
  end
  
  
end


