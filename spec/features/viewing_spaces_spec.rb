require 'pg'

feature 'View spaces' do
  scenario 'User can see all spaces for hire' do
    Space.create(name: 'Cosy cabin', user_id: '1',
      description: 'Escape to the countryside and relax by a log fire',
      price: 100)
    Space.create(name: 'London loft', user_id: '2',
      description: 'Live la vida loca',
      price: 200)

    visit '/spaces'
    expect(page).to have_content('Cosy cabin')
    expect(page).to have_content('London loft')
  end
end
