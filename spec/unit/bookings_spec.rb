require 'booking'
require_relative '../../app'

describe Booking do
  describe '.create' do
    it 'creates a new booking' do
      user = User.create
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: 100)
      booking = Booking.create(user_id: user.id],
        space_id:
        'Escape to the countryside and relax by a log fire',
        price: '100')

    end
  end
end
