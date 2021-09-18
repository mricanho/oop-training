# rubocop:disable Style/OptionalBooleanParameter, Naming/PredicateName
require_relative './corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end
  
  def self.display_persons(people)
    if people.length.positive?
      people.each { |people| puts "Name: #{people.name},  ID: #{people.id}, Age: #{people.age}" }
    else
      puts 'Students empty!!!'
    end
  end

  def create_new_person
    puts 'To create a new student enter (1), to create a new teacher enter (2)'
    inputed_choice = gets.chomp

    case inputed_choice
    when '1'
      puts 'Enter age: '
      age = gets.chomp

      puts 'Enter name: '
      name = gets.chomp

      puts 'Parent permission? (Enter Y for Yes or any other key for No)'
      parent_permission = gets.chomp
      parent_permission_ = parent_permission.downcase == 'y' ? true : false
      Student.new(age, name, parent_permission_)

      puts 'Student creation success!'
      
    when '2'
      puts 'Enter age: '
      age = gets.chomp

      puts 'Enter name: '
      name = gets.chomp

      puts 'Enter specialization: '
      specialization = gets.chomp

      Teacher.new(age, specialization, name)

      puts 'Teacher creation success!'

    else
      puts 'Invalid choice'
      nil
    end
  end
  
  def is_of_age?
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

# rubocop:enable Style/OptionalBooleanParameter, Naming/PredicateName
