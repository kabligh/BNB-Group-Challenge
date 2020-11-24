require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

      DatabaseConnection.setup('makersbnb_test')
    end

    it 'has a persistent connection' do
      connection = DatabaseConnection.setup('makersbnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  # describe '.query' do
  #   it 'executes a SQL query via PG' do
  #     connection = DatabaseConnection.setup('makersbnb_test')
  #
  #     expect(connection).to receive(:exec).with("SELECT * FROM spaces;")
  #
  #     DatabaseConnection.query("SELECT * FROM spaces;")
  #   end
  # end
end
