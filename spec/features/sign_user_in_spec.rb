feature 'Sign in' do
  scenario 'As a user, I want to sign-in for MakersBnB' do
    User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')
    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password1234'
    click_button 'Sign In'

    expect(page).to have_content 'Welcome, Tester'
  end
end
