#I want to buy this item(s) that costs $____ by this date how much money do i need to save each week to obtain this item(s).
# Note: It can be converted to hours (how much hours I need to work to get this item)-----> a bar graph of hours

class User
  def initialize(name, age, balance)
    @name = name
    @age = age
    @balance = balance
  end
  attr_accessor :name, :age, :balance
  # def
  #   savings = (student.balance -)
  # end
end

class Time
  def initialize(amount)
    @amount = amount
  end
  attr_accessor :amount
end

class Expense
  def initialize(spending)
    @spending = spending
  end
  attr_accessor :spending
end


array = []
puts "Greeting. Enter Name:"
name = gets.chomp
puts "Hello #{name}, How old are you?"
age = gets.chomp.to_i
puts "Please state your monthly income"
balance = gets.chomp.to_i
student = User.new(name, age, balance)
puts "So your current balane is #{student.balance}"

puts "Enter expenses:"
array << gets.chomp
puts "Enter 2nd"
array << gets.chomp

money = Expense.new(array)

puts money.spending

def date
puts "when would you like to purchase your item?"
  puts "A: 1 week"
  puts "B: 1 month"
  puts "C: other week"
  puts "D: other month"
  command = gets.chomp.upcase
  case command
  when "A"
    puts "One Week"
  when "B"
    puts "mamamamaam "
  when "C"
  yield(1)
  when "D"
  yield(2)
  else
    puts "error"
  end
end
date do |time|
  case time
  when 1
  puts "How many weeks?"
  howMany = gets.chomp.to_i
  when 2
  puts "How many weeks?"
  howMany = gets.chomp.to_i
  end
end
