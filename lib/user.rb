require_relative './database_connection'

class User
  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.create(name:, email:, password:)
    entry = DatabaseConnection.query(
      "INSERT INTO users (name, email, password)
       VALUES('#{name}', '#{email}', '#{password}')
       RETURNING id, name;")
    User.new(id: entry[0]['id'], name: entry[0]['name'])
  end
end
