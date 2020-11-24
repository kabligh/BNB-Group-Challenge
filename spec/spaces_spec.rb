require 'spaces'

describe Space do

  describe '.create' do
    it 'creates a new space' do
      space = Space.create(name: 'Cosy cabin', user_id: '1',
        description: 'Escape to the countryside and relax by a log fire',
        price: '100', from: '2020-12-19', to: '2021-01-03')

      expect(space.name).to eq 'Cosy cabin'
      expect(space.user_id).to eq '1'
      expect(space.description).to eq 'Escape to the countryside and relax by a log fire'
      expect(space.price).to eq '100'
      expect(space.from).to eq '2020-12-19'
      expect(space.to).to eq '2021-01-03'
    end
  end

end
