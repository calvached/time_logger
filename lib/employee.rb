class Employee
  attr_reader :username, :status_code

  def initialize(username, status_code)
    @username = username
    @status_code = status_code
  end
end
