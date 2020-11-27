require 'availability'

describe Availability do
  it 'lets user say when their space is available' do
    space = Space.create(name: 'Cosy cabin', user_id: '1',
      description: 'Escape to the countryside and relax by a log fire',
      price: '100')

    available = Availability.create(space_id: space.id, date: '2020-12-25')

    expect(available.date).to eq '2020-12-25'
  end
end
