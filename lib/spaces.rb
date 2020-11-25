require 'pg'

class Space

  attr_reader :id, :name, :user_id, :description, :price, :from, :to

  def initialize(id:, name:, user_id:, description:, price:, from:, to:)
    @id = id
    @name = name
    @user_id = user_id
    @description = description
    @price = price
    @from = from
    @to = to
  end

  def self.create(name:, user_id:, description:, price:, from:, to:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces(name, user_id, description, price, from_date, to_date)
      VALUES('#{name}', '#{user_id}', '#{description}', #{price}, '#{from}', '#{to}')
      RETURNING id, user_id, name, description, price, from_date, to_date;")
    Space.new(id: result[0]["id"], name: result[0]["name"], user_id: result[0]["user_id"], description: result[0]["description"], price: result[0]["price"], from: result[0]["from_date"], to: result[0]["to_date"])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map { |space| Space.new(id: space['id'], name: space['name'], user_id: space['user_id'], description: space['description'], price: space['price'], from: space['from'], to: space['to']) }
  end

end
