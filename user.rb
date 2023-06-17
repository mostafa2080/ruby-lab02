require_relative 'person'
require_relative 'contactable'

class User < Person
  include Contactable

  attr_accessor :email, :mobile

  def initialize(name, email, mobile)
    super(name)
    @email = email
    @mobile = mobile
  end

  def self.valid_mobile?(mobile)
    /^0\d{10}$/.match?(mobile)
  end

  def self.list(n = nil)
    users = read_users_from_file
    if n.nil?
      users.each { |user| puts user.contact_details }
    else
      users.first(n).each { |user| puts user.contact_details }
    end
  end

  def create
    if valid_data?
      store_user_to_file
      puts "Welcome, #{name}"
      self
    else
      puts 'Sorry, registration data is invalid'
      false
    end
  end

  private

  def valid_data?
    valid_name? && self.class.valid_mobile?(mobile)
  end

  def store_user_to_file
    File.open('users.txt', 'a') do |file|
      file.puts "#{name},#{email},#{mobile}"
    end
  end

  def self.read_users_from_file
    users = []
    File.foreach('users.txt') do |line|
      name, email, mobile = line.chomp.split(',')
      users << new(name, email, mobile)
    end
    users
  end
end