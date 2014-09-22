require 'database'

describe Database do
  let(:files) {{
                employees_file: 'data/test_employees.csv',
                clients_file: 'data/test_clients.csv',
               }}

  let(:database) { Database.new(files) }

  it 'returns all users' do
    expect(database.all_users).to include(Admin)
    expect(database.all_users).to include(Employee)
  end

  it 'returns all admins' do
    only_admins = database.admins.all? { |admin| admin.class }

    expect(only_admins).to eq(true)
  end

  it 'returns all employees' do
    only_employees = database.employees.all? { |employee| employee.class }

    expect(only_employees).to eq(true)
  end

  it 'returns all clients' do
    only_clients = database.clients.all? { |client| client.class }

    expect(only_clients).to eq(true)
  end

  it 'returns an employee' do
    expect(database.find('carlsagan')).to be_a_kind_of(Employee)
  end

  it 'returns an admin' do
    expect(database.find('calvached')).to be_a_kind_of(Admin)
  end

  xit 'adds a new employee' do
    # need to figure out how to test writing to a file
    database.create_user('flufferkins', 'false')

    expect(database.find('flufferkins')).to_not be_nil
  end
end
