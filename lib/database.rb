require 'parser'
require 'employee'
require 'admin'
require 'client'

class Database
  attr_reader :employees_file, :clients_file

  def initialize(files)
    @employees_file = files.fetch(:employees_file)
    @clients_file = files.fetch(:clients_file)
  end

  def find(username)
    all_users.select { |user| user.username == username }[0]
  end

  def create_user(username, admin_status)
    File.open(employees_file, 'a') { |file| file.write("#{username},#{admin_status}") }
  end

  def admins
    found_admins.reduce([]) do |admin_list, admin|
      admin_list << Admin.new(admin[:username])
    end
  end

  def employees
    found_employees.reduce([]) do |employee_list, employee|
      employee_list << Employee.new(employee[:username])
    end
  end

  def all_users
    admins + employees
  end

  def clients
    parsed(clients_file).reduce([]) do |client_list, client|
      client_list << Client.new(client[:company_name])
    end
  end

  private
  def found_admins
    parsed(employees_file).select { |employee| employee[:admin_status] }
  end

  def found_employees
    parsed(employees_file).select { |employee| !employee[:admin_status] }
  end

  def parsed(file)
    Parser.parse(file)
  end
end
