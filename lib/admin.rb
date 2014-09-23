require 'employee'

class Admin < Employee
  def initialize(username, status_code)
    super(username, status_code)
  end
end
