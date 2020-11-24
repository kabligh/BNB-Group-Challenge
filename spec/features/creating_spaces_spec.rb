require 'pg'

feature 'Creating spaces' do
  scenario 'Visiting list a space page' do
    visit('/spaces/new')
    expect(page).to have_content('List a space')
  end

  scenario 'Posting a new space on MakersBnB' do
    visit ('/spaces/new')
    fill_in('name', with: 'Cosy cabin')
    fill_in('description', with: 'Escape to the countryside and relax by a log fire')
    fill_in('Price', with: 100)
    fill_in('Available from', with: 2020-12-19)
    fill_in('Available to', with: 2021-01-03)
    click_button('List my space')
  end
end
