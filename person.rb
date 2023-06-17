class Person
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def valid_name?
      /^[a-zA-Z]+$/.match?(name)
    end
  end
  