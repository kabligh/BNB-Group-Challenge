require 'spaces'

describe Space do

  describe '.create' do
    it 'creates a new space' do
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: '100', from_date: '2020-12-19', to_date: '2021-01-03')

      expect(space.name).to eq 'Cosy cabin'
      expect(space.user_id).to eq '1'
      expect(space.description).to eq 'Escape to the countryside and relax by a log fire'
      expect(space.price).to eq '100'
      expect(space.from_date).to eq '2020-12-19'
      expect(space.to_date).to eq '2021-01-03'
    end
  end

  describe '.all' do
    it 'lists all the spaces' do
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: 100, from_date: '2020-12-19', to_date: '2021-01-03')
      Space.create(name: 'London loft', user_id: '2',
        description: 'Live la vida loca',
        price: 200, from_date: '2021-01-29', to_date: '2021-02-03')

      spaces = Space.all

      expect(spaces.length).to eq 2
      expect(spaces.first).to be_a Space
      expect(spaces.first.name).to eq 'Cosy cabin'
      expect(spaces.last.name).to eq 'London loft'
      expect(spaces.first.id).to eq space.id
    end
  end

  describe '.available' do
    it 'gives available spaces' do
      house = Space.create(name: 'Some house', user_id: '5',
        description: 'Some house somewhere',
        price: 100, from_date: '2020-12-25', to_date: '2020-12-31')
      p house

      house1 = Space.create(name: 'Some house1', user_id: '6',
        description: 'Some house somewhere',
        price: 100, from_date: '2020-12-20', to_date: '2020-12-29')

      house2 = Space.create(name: 'Some house2', user_id: '7',
        description: 'Some house somewhere',
        price: 100, from_date: '2020-12-18', to_date: '2020-12-22')

      request = Space.available(from_date: '2020-12-25', to_date: '2020-12-31')
      p request

      expect(request.first.name).to eq "Some house"
    end
  end
end
