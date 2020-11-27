class Availability do

  def initialize(id:, space_id:, date:)
    @id = id
    @space_id = space_id
    @date = date
  end

  def self.create(space_id:, date:)
    result = DatabaseConnection.query(
      "INSERT INTO availability(space_id, date) VALUES ('#{space_id}', '#{date}')
      RETURNING id, space_id, date;")
    Availability.new(id: , space_id:,  )
  end
