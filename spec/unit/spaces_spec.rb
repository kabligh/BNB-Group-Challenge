require 'spaces'

describe Space do

  describe '.create' do
    it 'creates a new space' do
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: '100')

      expect(space.name).to eq 'Cosy cabin'
      expect(space.user_id).to eq '1'
      expect(space.description).to eq 'Escape to the countryside and relax by a log fire'
      expect(space.price).to eq '100'
    end
  end

  describe '.all' do
    it 'lists all the spaces' do
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: 100)
      Space.create(name: 'London loft', user_id: '2',
        description: 'Live la vida loca',
        price: 200)

      spaces = Space.all

      expect(spaces.length).to eq 2
      expect(spaces.first).to be_a Space
      expect(spaces.first.name).to eq 'Cosy cabin'
      expect(spaces.last.name).to eq 'London loft'
      expect(spaces.first.id).to eq space.id
    end
  end
end
