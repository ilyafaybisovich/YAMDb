require 'rails_helper'

feature 'searching for a movie' do

  scenario 'takes user to the movies page if it exists' do
    visit '/'
    fill_in 'Movie', with: 'The Matrix'
    click_button 'Search'
    movie = Movie.create(title: 'The Matrix')
    expect(current_path).to eq movie_path(movie)
  end

end