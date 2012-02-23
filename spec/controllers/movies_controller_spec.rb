require 'spec_helper'

describe MoviesController do
  describe 'Search Movies by Director' do
    before(:each) do 
      @fake_results = [mock('Movie'), mock('Movie')]
      @fake_result = mock('Movie')
    end
  
    it 'should search for movies with the same director' do 
      
      Movie.should_receive(:find).with("id").and_return(@fake_result)
      assigns(:movie).should == @fake_result
     
      #Movie.should_receive(:find_all_by_director).with(@fake_result.director).and_return(@fake_results)
      
      get :search_director , {:id => "id"}  
    end
    
    it 'should select the Search Results template for rendering' do
      Movie.stub(:find_all_by_director).and_return(@fake_results)
      get :search_director, {:id => "id", :director => "director"}  
      response.should render_template('search_director')
    end
    it 'should make the search_director results available to that template' do
      Movie.stub(:find_all_by_director).and_return(@fake_results)
      get :search_director, {:id => "id", :director => "director"}
      assigns(:movies).should == @fake_results
    end
  end
end


