class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
    @book = book
    book.rentals << self
    person.rentals << self
  end
end
