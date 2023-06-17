require_relative 'user'

puts 'Enter (*) to list all registered users or the number of users you would like to list:'
input = gets.chomp

if input == '*'
  User.list
else
  n = input.to_i
  User.list(n)
end
