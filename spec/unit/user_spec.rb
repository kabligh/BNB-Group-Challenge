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
end
