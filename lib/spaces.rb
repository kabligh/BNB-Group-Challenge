require 'pg'

class Space

  attr_reader :id, :name, :user_id, :description, :price

  def initialize(id:, name:, user_id:, description:, price:)
    @id = id
    @name = name
    @user_id = user_id
    @description = description
    @price = price
  end

  def self.create(name:, user_id:, description:, price:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces(name, user_id, description, price)
      VALUES('#{name}', '#{user_id}', '#{description}', #{price})
      RETURNING id, user_id, name, description, price")
    Space.new(id: result[0]["id"], name: result[0]["name"], user_id: result[0]["user_id"], description: result[0]["description"], price: result[0]["price"])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map { |space| Space.new(id: space['id'], name: space['name'], user_id: space['user_id'], description: space['description'], price: space['price']) }
  end
end
