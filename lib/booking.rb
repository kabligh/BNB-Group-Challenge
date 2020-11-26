class Booking

  attr_reader :id, :user_id, :space_id, :date

  def initialize(id:, user_id:, space_id:, date:)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @date = date
  end

  def create(user_id:, space_id:, date:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings(user_id, space_id, date)
      VALUES('#{user_id}', '#{space_id}', '#{date})
      RETURNING id, user_id, space_id, date")
  end 
end
