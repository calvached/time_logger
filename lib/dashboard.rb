require 'messages'
require 'menu'

class Dashboard
  attr_reader :io

  def initialize(database, input_output)
    @database = database
    @io = input_output
  end

  def run
    @current_user = io.username_prompt(Messages::ENTER_USERNAME, database.all_users)

    io.out(Menu.main[@current_user.status_code])
    get_selection(@current_user.status_code)
    # based on the user.status_code prompt will know
    # whether a selection is valid or not
  end

  def display_clients
    io.out(Menu.clients(database.clients))
  end

  #def admin_options
  #  user_input = get_selection

  #  if admin_menu[user_input]
  #    admin_menu[user_input]
  #  else
  #    @io.out(Messages::INVALID_SELECTION)
  #  end
  #end

  #def admin_menu
  #  {
  #    '1' => Proc.new{@current_user.log_time},
  #    '2' => Proc.new{@current_user.add_employee},
  #    '3' => Proc.new{@current_user.add_client},
  #    '4' => Proc.new{@current_user.view_monthly_report},
  #    '5' => Proc.new{@current_user.view_summary_report},
  #  }
  #end

  #def employee_options
  #  @io.out(Messages::EMPLOYEE_MENU)
  #  user_input = get_selection
  #  employee_menu
  #end

  def get_selection(status_code)
    #maybe send a hash of validations
    #validations = { 'regex' => /\d/, 'status_code' => status_code }
    user_input = io.selection_prompt(Messages::MAKE_SELECTION, 'regex', /\d/)

    if status_code == 'admin'
      user_input
    else
    end
  end

  def database
    @database
  end
end
