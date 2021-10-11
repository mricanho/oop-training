class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def self.create_new_rental(books, people)
    puts 'Enter a number corresponding with a book of your choice'
    books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Enter a number corresponding with a book of your choice'
    people.each_with_index do |student, index|
      puts "#{index}. [#{student.class}] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
    end
    student_index = gets.chomp.to_i

    puts 'Enter date: '
    date = gets.chomp

    Rental.new(date, books[book_index], people[student_index])
    puts 'Rent success!'
  end

  def self.display_rentals(rentals)
    puts 'Enter student id: '
    id = gets.chomp.to_i

    rentals = rentals.filter { |rental| rental.person.id == id }
    puts "All rentals of the student with ID #{id}:"
    if rentals.length.positive?
      rentals.each do |rental|
        puts "Rental date: #{rental.date}, Book rent on: \"#{rental.book.title}\" Written by: #{rental.book.author}"
      end
    else
      puts "No book is on rent by the student with ID #{id}."
    end
  end
end
