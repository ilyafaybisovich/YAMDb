require 'rails_helper'

feature 'movies are listed on the homepage' do

  scenario 'when there are no movies ' do
    visit '/'
    expect(page).to have_content 'No movies listed. Add the first one!'
  end

  scenario 'when there is at least one movie in the db' do
    Movie.create(title: 'Liversedge', description: 'Theres a ghost in the fields')
    Movie.create(title: 'Liversedge 2', description: 'Theres another ghost in the fields')
    visit '/'
    expect(page).to have_content 'Liversedge'
    expect(page).to have_content 'Theres a ghost in the fields'
    expect(page).to have_content 'Liversedge 2'
    expect(page).to have_content 'Theres another ghost in the fields'
  end
end