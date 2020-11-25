require 'user'

describe User do

  describe '.create' do
    it 'create a new user' do
      user = User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')
      table_data = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user.id}")

      expect(user).to be_a User
      expect(user.id).to eq table_data.first['id']
      expect(user.name).to eq 'Tester'
    end
  end

  describe '.find' do
    it 'finds the user by an id' do
      user = User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')
      search = User.find(id: user.id)

      expect(search.id).to eq user.id
      expect(search.name).to eq user.name
    end

    it 'returns nil if there is no id given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email and password, if one exists' do
      user = User.create(name: 'Tester', email: 'jim@gmail.com', password: 'password1234')
      authenticated_user = User.authenticate(email: 'jim@gmail.com', password: 'password1234')

      expect(authenticated_user.id).to eq user.id
    end
  end
end
