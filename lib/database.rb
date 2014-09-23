require 'parser'
require 'employee'
require 'admin'
require 'client'

class Database
  attr_reader :users_file, :clients_file, :pto_file, :billable_file, :non_billable_file

  def initialize(files)
    @users_file = files.fetch(:users_file)
    @clients_file = files.fetch(:clients_file)
    @pto_file = files.fetch(:pto_file)
    @billable_file = files.fetch(:billable_file)
    @non_billable_file = files.fetch(:non_billable_file)
  end

  def find(username)
    all_users.select { |user| user.username == username }[0]
  end

  def add_user(username, admin_status)
    File.open(employees_file, 'a') { |file| file.write("#{username},#{admin_status}") }
  end

  def admins
    found_admins = found_user_type('admin')
    create_user_type(Admin, found_admins)
  end

  def employees
    found_employees = found_user_type('employee')
    create_user_type(Employee, found_employees)
  end

  def all_users
    admins + employees
  end

  def clients
    parsed(clients_file).reduce([]) do |client_list, client|
      client_list << Client.new(client[:company_name])
    end
  end

  def all_pto
    create_project_type(Pto, parsed(pto_file))
  end

  def all_non_billable
    create_project_type(NonBillable, parsed(non_billable_file))
  end

  def all_billable
    parsed(billable_file).reduce([]) do |collection, row|
      collection << Billable.new(row[:year],
                                   row[:month],
                                   row[:day],
                                   row[:hours],
                                   row[:client],
                                   row[:username])
    end
  end

  # DB Users, Clients, Timecodes(Projects)

  private
  def found_user_type(user_type)
    parsed(users_file).select { |user| user[:status_code] == user_type }
  end

  def parsed(file)
    Parser.parse(file)
  end

  def create_user_type(class_name, parsed_file)
    parsed_file.reduce([]) do |collection, row|
      collection << class_name.new(row[:username],
                                   row[:status_code])
    end
  end

  def create_project_type(class_name, parsed_file)
    parsed_file.reduce([]) do |collection, row|
      collection << class_name.new(row[:year],
                                   row[:month],
                                   row[:day],
                                   row[:hours],
                                   row[:username])
    end
  end
end
