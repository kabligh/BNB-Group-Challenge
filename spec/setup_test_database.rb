require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  # Clear the peeps table before each test
  connection.exec('TRUNCATE spaces;')
end
