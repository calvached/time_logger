require 'messages'

describe Messages do
  it 'formats a client' do
    expect(Messages.format_client('Dunkin Donuts', 0)).to eq("1. Dunkin Donuts")
    expect(Messages.format_client('Chipotle', 1)).to eq("2. Chipotle")
  end
end
