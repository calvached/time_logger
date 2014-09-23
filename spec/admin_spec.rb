require 'admin'

describe Admin do
  let (:admin) { Admin.new('cupcakegalore', 'employee') }

  it 'contains a username' do
    expect(admin.username).to eq('cupcakegalore')
  end

  it 'has a status code' do
    expect(admin.status_code).to eq('employee')
  end
end
