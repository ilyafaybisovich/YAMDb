require 'rails_helper'
require_relative '../devise_helper'

feature 'users can contribute to YAMDb' do
  scenario 'signed-in user can add film not already in the database' do
    log_in
    click_link 'Add Movie'
    fill_in 'Title', with: 'Avatar'
    fill_in 'Description', with: 'Saving the forest.'
    click_button 'Add Movie'
    avatar = Movie.find_by(title: 'Avatar')
    expect(current_path).to eq movie_path(avatar)
    expect(page).to have_content 'Avatar'
    expect(page).to have_content 'Saving the forest.'
    expect(page).to have_content 'Movie successfully added.'
  end

  scenario 'users can only add film if they are signed in' do
    visit '/'
    expect(page).not_to have_link 'Add Movie'
  end
end