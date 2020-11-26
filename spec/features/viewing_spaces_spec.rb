require 'pg'

feature 'View spaces' do
  scenario 'User can see all spaces for hire' do
    Space.create(name: 'Cosy cabin', user_id: '1',
      description: 'Escape to the countryside and relax by a log fire',
      price: 100, from_date: '2020-12-19', to_date: '2021-01-03')
    Space.create(name: 'London loft', user_id: '2',
      description: 'Live la vida loca',
      price: 200, from_date: '2021-01-29', to_date: '2021-02-03')

    visit '/spaces'
    expect(page).to have_content('Cosy cabin')
    expect(page).to have_content('London loft')
  end
end
