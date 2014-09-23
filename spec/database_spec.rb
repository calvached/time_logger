require 'database'

describe Database do
  let(:files) {{
                users_file: 'data/test_employees.csv',
                clients_file: 'data/test_clients.csv',
                pto_file: 'data/test_pto.csv',
                billable_file: 'data/test_billable.csv',
                non_billable_file: 'data/test_non_billable.csv',
               }}

  let(:database) { Database.new(files) }

  describe 'Users' do
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
      database.add_user('flufferkins', 'admin')

      expect(database.find('flufferkins')).to_not be_nil
    end
  end

  describe 'Time Codes' do
    it 'returns all pto projects' do
      ptos = database.all_pto.all? { |pto| pto.class }

      expect(ptos).to eq(true)
    end

    it 'returns all billable projects' do
      bills = database.all_billable.all? { |bill| bill.class }

      expect(bills).to eq(true)
    end

    it 'returns all non billable projects' do
      non_bills = database.all_non_billable.all? { |non_bill| non_bill.class }

      expect(non_bills).to eq(true)
    end
  end
end
