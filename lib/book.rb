require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, seld, person)
    @rentals.push(rental)
  end

  def self.create_new_book
    puts 'Enter title: '
    title = gets.chomp

    puts 'Enter author: '
    author = gets.chomp

    Book.new(title, author)

    puts 'Book creation success!'
  end

  def self.display_books(books)
    if books.length.positive?
      books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    else
      puts 'Books empty!!!'
    end
  end
end
