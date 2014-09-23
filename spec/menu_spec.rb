require 'menu'

describe Menu do
  it 'returns an admin menu' do
    expect(Menu.main['admin']).to eq(Menu::ADMIN)
  end

  it 'returns an employee menu' do
    expect(Menu.main['employee']).to eq(Menu::EMPLOYEE)
  end

  it 'formats a client' do
    expect(Menu.format_client('Dunkin Donuts', 0)).to eq("1. Dunkin Donuts\n")
    expect(Menu.format_client('Chipotle', 1)).to eq("2. Chipotle\n")
  end

  it 'returns a list of clients' do
    clients = []
    client_1 = instance_double('Client', :company_name => 'Subway')
    client_2 = instance_double('Client', :company_name => 'Chipotle')
    clients << client_1
    clients << client_2

    expect(Menu.clients(clients)).to eq("Client List\n1. Subway\n2. Chipotle\n")
  end
end
