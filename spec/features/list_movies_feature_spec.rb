require 'rails_helper'

feature 'movies are listed on the homepage' do
  scenario 'when there are no movies ' do
    visit '/'
    expect(page).to have_content 'No movies listed. Add the first one!'
  end
end