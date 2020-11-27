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
    fill_in('price', with: 100)
    click_button('List my space')
  end
end
