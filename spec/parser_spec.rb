require 'parser'

describe Parser do
  it 'parses a file of employees' do
    employees = Parser.parse('data/test_employees.csv')

    expect(employees.first[:username]).to eq('carlsagan')
    expect(employees.first[:admin_status]).to eq(false)
    expect(employees.last[:username]).to eq('calvached')
    expect(employees.last[:admin_status]).to eq(true)
  end

  it 'parses a file of clients' do
    clients = Parser.parse('data/test_clients.csv')

    expect(clients.first[:company_name]).to eq('Fluffy Couches')
    expect(clients.last[:company_name]).to eq('Subway')
  end
end
