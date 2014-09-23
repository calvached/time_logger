require 'csv'

class Parser
  def self.parse(file)
    parsed_data = []

    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      parsed_data << row
    end

    parsed_data
  end
end
