feature 'Sign in' do
  scenario 'As a user, I want to sign-in for MakersBnB' do
    User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')
    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password1234'
    click_button 'Sign in'

    expect(page).to have_content 'Welcome, Tester'
  end

  scenario 'User sees error if they get their email wrong' do
    User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')

    visit '/sessions/new'
    fill_in :email, with: 'wrong@gmail.com'
    fill_in :password, with: 'password1234'
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, Tester'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'User sees an error if they get their password wrong' do
    User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')

    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password0000'
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, Tester'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'User can sign out' do
    User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')

    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password1234'
    click_button 'Sign in'
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, Tester'
    expect(page).to have_content 'You have signed out.'
  end
end
