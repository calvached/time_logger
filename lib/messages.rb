class Messages
  ENTER_USERNAME = 'Enter Username: '

  MAKE_SELECTION = "Select an option: "

  INPUT_DATE = 'Input date (eg. dd/mm/yyyy): '

  INPUT_HOURS = 'Input hours (eg. 2): '

  INPUT_TIMECODE = "Input a timecode from the following 'PTO, Billable, or Non-Billable': "

  INVALID_SELECTION = "Invalid selection. Try again.\n\n"

  NOT_FOUND = "Command Invalid. Try again.\n\n"

  CLIENT_HEADER = "Client List\n"

  CLIENT_FOOTER = 'Select a client: '

  def self.format_client(client_name, index)
    "#{index + 1}. #{client_name}"
  end
end
