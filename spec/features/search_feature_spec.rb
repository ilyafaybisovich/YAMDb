require 'rails_helper'

feature 'searching for a movie' do

  scenario 'takes user to the movies page if it exists' do
    movie = Movie.create(title: 'The Matrix', description: 'A movie about pills.')
    visit '/'
    fill_in 'Movie', with: 'The Matrix'
    click_button 'Search'
    expect(current_path).to eq movie_path(movie)
    expect(page).to have_content 'The Matrix'
    expect(page).to have_content 'A movie about pills.'
  end

  scenario 'displays useful error message if movie does not exist' do
    visit '/'
    fill_in 'Movie', with: 'The Aardvark'
    click_button 'Search'
    expect(current_path).to eq '/'
    expect(page).to have_content 'This movie is not in YAMDb. Try again!'
  end

end