require 'booking'
require_relative '../../app'

describe Booking do
  describe '.create' do
    it 'creates a new booking' do
      user = User.create(name: 'Tester', email: 'test@gmail.com', password: 'password1234')
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: 100)
      booking = Booking.create(user_id: user.id, space_id: space.id, date: "2020/10/31")

        expect(booking.user_id).to eq user.id
        expect(space.space_id).to eq space.id
        expect(space.date).to eq "2020/10/31"
    end
  end
end
