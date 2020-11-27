require 'pg'

class Space

  attr_reader :id, :name, :user_id, :description, :price, :from_date, :to_date

  def initialize(id:, name:, user_id:, description:, price:, from_date:, to_date:)
    @id = id
    @name = name
    @user_id = user_id
    @description = description
    @price = price
    @from_date = from_date
    @to_date = to_date
  end

  def self.create(name:, user_id:, description:, price:, from_date:, to_date:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces(name, user_id, description, price, from_date, to_date)
      VALUES('#{name}', '#{user_id}', '#{description}', #{price}, '#{from_date}', '#{to_date}')
      RETURNING id, user_id, name, description, price, from_date, to_date;")
    Space.new(id: result[0]["id"], name: result[0]["name"], user_id: result[0]["user_id"], description: result[0]["description"], price: result[0]["price"], from_date: result[0]["from_date"], to_date: result[0]["to_date"])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map { |space| Space.new(id: space['id'], name: space['name'], user_id: space['user_id'], description: space['description'], price: space['price'], from_date: space['from_date'], to_date: space['to_date']) }
  end

  def self.available(from_date:, to_date:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE from_date >= '#{from_date}' AND to_date <= '#{to_date}';")
    result.map { |space| Space.new(id: space['id'], name: space['name'], user_id: space['user_id'], description: space['description'], price: space['price'], from_date: space['from_date'], to_date: space['to_date']) }
  end
  
end
