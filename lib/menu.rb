class Menu
  EMPLOYEE = "\nHome Screen\n" +
                  "1. Log Time\n" +
                  "2. View Monthly Report\n\n"

  ADMIN = "\nHome Screen\n" +
               "1. Log Time\n" +
               "2. View Monthly Report\n" +
               "3. Add New Employee\n" +
               "4. Add New Client\n" +
               "5. View Summary Report\n\n"

  CLIENT_HEADER = "Client List\n"

  def self.main
    {
      "admin" => ADMIN,
      "employee" => EMPLOYEE,
    }
  end

  def self.clients(clients)
    menu = []
    menu << CLIENT_HEADER

    clients.each_with_index do |client, i|
      menu << format_client(client.company_name, i)
    end

    menu.join
  end

  private
  def self.format_client(client_name, index)
    "#{index + 1}. #{client_name}\n"
  end
end
