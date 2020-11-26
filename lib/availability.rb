# class Availability
#
#   attr_reader :space_id, :date_required
#
#   def initialize(id:, space_id:, date_required:)
#     @id = id
#     @space_id = space_id
#     @date_required = date_required
#     @unavailable_dates = []
#   end
#
#   def self.create(:space_id, :date_required)
#     result = DatabaseConnection.query(
#       "INSERT INTO availability(space_id, date_required)
#       VALUES('#{space_id}', '#{date_required}')
#       RETURNING space_id, date_required")
#     Availability.new(id: result[0]["id"], space_id: result[0]["space_id"], date_required: result[0]["date_required"])
#   end
#
#   def self.find(space_id:, date_required:)
#     return 'Date Available' unless date_booked
#
#     search = DatabaseConnection.query(
#       "SELECT *
#         FROM users
#        WHERE id = #{id};")
#
#     User.new(id: search[0]['id'], name: search[0]['name'])
#   end
# end
