class Space

  attr_reader :name, :user_id, :description, :price, :from, :to

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
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO spaces
      (name, user_id, description, price, from_date, to_date) VALUES('#{name}', '#{user_id}', '#{description}', '#{price}', '#{from}', '#{to}')
      RETURNING id, user_id, name, description, price, from_date, to_date;")
    Space.new(id: result[0]["id"], name: result[0]["name"], user_id: result[0]["user_id"],
      description: result[0]["description"], price: result[0]["price"], from: result[0]["from_date"], to: result[0]["to_date"])
  end

end
