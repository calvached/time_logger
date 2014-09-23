require 'dashboard'
require 'database'
require 'messages'
require 'input_output'

describe Dashboard do
  let(:files) {{
                users_file: 'data/test_employees.csv',
                clients_file: 'data/test_clients.csv',
                pto_file: 'data/test_pto.csv',
                billable_file: 'data/test_billable.csv',
                non_billable_file: 'data/test_non_billable.csv',
               }}
  let(:db) { Database.new(files) }
  let(:io) { MockIO.new }
  let(:dashboard) { Dashboard.new(db, io) }

  it 'displays a list of clients' do
    dashboard.display_clients

    expect(dashboard.io.received_messages).to eq([
      "Client List\n1. Fluffy Couches\n2. Big Data Scrapers\n3. XFH\n4. Bernie's Bistro\n5. Subway\n"
    ])
  end

  it '' do
  end
end
