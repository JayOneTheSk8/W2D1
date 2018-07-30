require 'byebug'

class Employee

  attr_reader :name
  attr_accessor :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    unless boss.nil?
      @boss.employees << self
    end
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def salary_adder(worker)
    return worker.salary if worker.class == Employee
    money = 0
    worker.employees.each { |employ|  employ.class == Manager ? employ.salary_adder : money += employ.salary}
    money
  end

end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    all_salaries = 0
    employees.each do |employee|
      if employee.class == Manager
        all_salaries += employee.salary
      end
      all_salaries += salary_adder(employee)
    end

    all_salaries * multiplier
  end


end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
