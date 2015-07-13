require 'rails_helper'
require 'devise_helper'

feature 'users can contribute to YAMDb' do
  scenario 'signed-in user can add film not already in the database' do
    click_link 'Add Movie'
    fill_in 'Title', with: 'Avatar'
    fill_in 'Description', with: 'Saving the forest.'
    click_button 'Add Movie'
    avatar = Movie.find_by(title: 'Avatar')
    expect(current_path).to eq movie_path(avatar)
    expect(page).to have_content 'Avatar'
    expect(page).to have_content 'Saving the forest.'
  end
end