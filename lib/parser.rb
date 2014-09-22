require 'csv'

class Parser
  def self.parse(file)
    parsed_data = []

    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      if row[:admin_status]
        row[:admin_status] = to_boolean(row[:admin_status])
      end

      parsed_data << row
    end

    parsed_data
  end

  private
  def self.to_boolean(string)
    string == 'true'
  end
end
