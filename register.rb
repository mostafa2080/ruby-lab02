require_relative 'user'

puts 'Name:'
name = gets.chomp

puts 'Email:'
email = gets.chomp

puts 'Mobile:'
mobile = gets.chomp

user = User.new(name, email, mobile)
user.create