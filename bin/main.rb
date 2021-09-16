require_relative '../lib/book'
require_relative '../lib/classroom'
require_relative '../lib/corrector'
require_relative '../lib/student'
require_relative '../lib/rental'
require_relative '../lib/student'
require_relative '../lib/teacher'
require_relative '../lib/messages'

class Main
  def initialize
    @books = []
    @people = []
    @rentals = []
  end
  def display_books
    if @books.length.positive?
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    else
      puts 'Books empy!!!'
    end
  end

  def display_students
    if @students.length.positive?
      puts "Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
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
        @people << Student.new(age, name, parent_permission_)

        puts 'Student creation success!'
      
      when '2'
        puts 'Enter age: '
        age = gets.chomp

        puts 'Enter name: '
        name = gets.chomp

        puts 'Enter specialization: '
        specialization = gets.chomp

        @people << Teacher.new(age, specialization, name)

        puts 'Teacher creation success!'

      else
        puts 'Invalid choice'
        nil
      end
  end

  def create_new_book
    puts 'Enter title: '
    title = gets.chomp

    puts 'Enter author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts 'Book creation success!'
  end

  def create_new_rental
    puts 'Enter a number corresponding with a book of your choice'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "Enter a number corresponding with a book of your choice"
    @students.each_with_index do |student, index|
      puts "#{index}. [#{student.class}] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
    end
    student_index = gets.chomp.to_i

    puts "Enter date: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @students[student_index])
    puts 'Rent success!'
  end

  def display_rentals
    puts 'Enter student: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.student.id == id }
    puts "All rentals of the student with ID #{id}:"
    rentals.each do |rental|
      puts "Rental date: #{rental.date}, Book rent on: \"#{rental.book.title}\" Written by: #{rental.book.author}"
    end
  end
end

  def welcome_message
    puts Messages::INTRODUCTION
    puts "The following is the list of options available on this app"
    while (inputed_choice >= inputed_choice.to_i or inputed_choice == 0) do
      puts 'Please choose an option by enterin a number:'
      puts '1 - Display all books'
      puts '2 - Display all people'
      puts '3 - Create a new person'
      puts '4 - Create a new book'
      puts '5 - Rent a book'
      puts '6 - Display all rentals for a given person'
      puts '7 - Exit'
      puts "\n"
      puts 'Choose one of the options above:'
      inputed_choice = gets.chomp.to_i
  
      case selection
      when 1
        app.all_books
      when 2
        app.all_people
      when 3
        app.create_person
      when 4
        app.create_book
      when 5
        app.create_rental
      when 6
        app.list_rentals
      else
        puts 'Thank you for using our app, you can always come back'
      end
      puts "\n"
  end
end
def main
  welcome_message
end
main = Main.new

main.main
