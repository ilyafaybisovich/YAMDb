require 'rails_helper'
require 'devise_helper'

feature 'reviewing movies' do
  scenario 'logged in usser can review a movie' do
    riversedge = Movie.create(title: "River's edge", description: "Ecological disaster threatens Brno.")
    log_in
    visit movie_path(riversedge)
    click_link 'Add a review'
    fill_in 'Thoughts', with: 'Top class.'
    choose 'review_rating_4'
    click_button 'Submit review'
    expect(current_path).to eq movie_path riversedge
    expect(page).to have_content 'Thoughts: Top class.'
    expect(page).to have_content 'Rated: 4'
  end
end