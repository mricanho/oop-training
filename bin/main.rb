# rubocop:disable Metrics/CyclomaticComplexity
require_relative '../lib/book'
require_relative '../lib/classroom'
require_relative '../lib/corrector'
require_relative '../lib/student'
require_relative '../lib/rental'
require_relative '../lib/teacher'
require_relative '../lib/messages'
require_relative '../lib/person'

class Main
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_message
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
  end

  def welcome_message # rubocop:disable Metrics/ClassLength
    puts Messages::INTRODUCTION
    puts 'The following is the list of options available on this app'
    inputed_choice = 0
    while inputed_choice != 7
      display_message
      inputed_choice = gets.chomp.to_i

      case inputed_choice
      when 1
        Book.display_books(@books)
      when 2
        Person.display_persons(@people)
      when 3
        @people << Person.create_new_person
      when 4
        @books = Book.create_new_book
      when 5
        @rental << Rental.create_new_rental(@books, @people)
      when 6
        Rental.display_rentals(@rental)
      else
        puts 'Thank you for using our app, you can always come back'
      end
      puts "\n"
    end
  end

  def main
    welcome_message
  end
end

main = Main.new
main.main
# rubocop:enable Metrics/CyclomaticComplexity
