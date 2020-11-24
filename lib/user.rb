require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    entry = DatabaseConnection.query(
      "INSERT INTO users (name, email, password)
       VALUES('#{name}', '#{email}', '#{encrypted_password}')
       RETURNING id, name;")
    User.new(id: entry[0]['id'], name: entry[0]['name'])
  end

  def self.find(id:)
    return nil unless id

    search = DatabaseConnection.query(
      "SELECT *
        FROM users
       WHERE id = #{id};")

    User.new(id: search[0]['id'], email: search[0]['email'])
  end

end
