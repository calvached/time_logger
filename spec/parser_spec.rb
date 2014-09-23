require 'parser'

describe Parser do
  it 'parses a file of employees' do
    employees = Parser.parse('data/test_employees.csv')

    expect(employees.first[:username]).to eq('carlsagan')
    expect(employees.first[:status_code]).to eq('employee')

    expect(employees.last[:username]).to eq('calvached')
    expect(employees.last[:status_code]).to eq('admin')
  end

  it 'parses a file of clients' do
    clients = Parser.parse('data/test_clients.csv')

    expect(clients.first[:company_name]).to eq('Fluffy Couches')
    expect(clients.last[:company_name]).to eq('Subway')
  end

  it 'parses billable projects' do
    billable = Parser.parse('data/test_billable.csv')

    expect(billable.first[:username]).to eq('calvached')
    expect(billable.first[:client]).to eq('Fluffy Couches')
    expect(billable.first[:hours]).to eq('2')
    expect(billable.first[:year]).to eq('2014')
    expect(billable.first[:month]).to eq('07')
    expect(billable.first[:day]).to eq('01')
  end

  it 'parses non billable projects' do
    billable = Parser.parse('data/test_non_billable.csv')

    expect(billable.first[:username]).to eq('annerice')
    expect(billable.first[:hours]).to eq('3')
    expect(billable.first[:year]).to eq('2014')
    expect(billable.first[:month]).to eq('08')
    expect(billable.first[:day]).to eq('20')
  end

  it 'parses pto projects' do
    billable = Parser.parse('data/test_pto.csv')

    expect(billable.first[:username]).to eq('alexanderhamilton')
    expect(billable.first[:hours]).to eq('3')
    expect(billable.first[:year]).to eq('2014')
    expect(billable.first[:month]).to eq('08')
    expect(billable.first[:day]).to eq('23')
  end
end
