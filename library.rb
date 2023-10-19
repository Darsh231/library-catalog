class Book
    attr_accessor :title, :author, :isbn, :publication_year
  
    def initialize(title, author, isbn, publication_year)
      @title = title
      @author = author
      @isbn = isbn
      @publication_year = publication_year
    end
  
    def to_s
      "#{title} by #{author} (ISBN: #{isbn}, Year: #{publication_year})"
    end
  end
  
  class FictionBook < Book
    def genre
      "Fiction"
    end
  end
  
  class NonFictionBook < Book
    def genre
      "Non-Fiction"
    end
  end
  
  class ScienceFictionBook < Book
    def genre
      "Science Fiction"
    end
  end
  
  module Catalogable
    def add_book(book)
      @books ||= []
      @books << book
      p "Added #{book.title} to the catalog"
    end
  
    def books
      @books
    end
  end
  
  module Searchable
    def search(title: nil, author: nil, isbn: nil, publication_year: nil)
      results = books.select do |book|
        (title.nil? || book.title.include?(title)) &&
        (author.nil? || book.author.include?(author)) &&
        (isbn.nil? || book.isbn == isbn) &&
        (publication_year.nil? || book.publication_year == publication_year)
      end
  
      if results.empty?
        puts "No matching books found."
      else
        puts "Matching Books:"
        results.each { |book| puts book.to_s }
      end
    end
  end
  
  class LibraryCatalog
    include Catalogable
    include Searchable
  end
  
  # Main Application
  library_catalog = LibraryCatalog.new
  
  loop do
    puts "\nOptions:"
    puts "1. Add a Book"
    puts "2. Search for a Book"
    puts "3. Exit"
  
    choice = gets.chomp.to_i
  
    case choice
    when 1
      print "Title: "
      title = gets.chomp
      print "Author: "
      author = gets.chomp
      print "ISBN: "
      isbn = gets.chomp
      print "Publication Year: "
      publication_year = gets.chomp.to_i
  
      print "Genre (Fiction/Non-Fiction/Science Fiction): "
      genre = gets.chomp
  
      book_class = case genre.downcase
                   when "fiction"
                     FictionBook
                   when "non-fiction"
                     NonFictionBook
                   when "science fiction"
                     ScienceFictionBook
                   else
                     Book
                   end
  
      book = book_class.new(title, author, isbn, publication_year)
      library_catalog.add_book(book)
  
    when 2
      print "Title (or leave blank): "
      title = gets.chomp
      print "Author (or leave blank): "
      author = gets.chomp
      print "ISBN (or leave blank): "
      isbn = gets.chomp
      print "Publication Year (or leave blank): "
      publication_year = gets.chomp.to_i
  
      library_catalog.search(title: title, author: author, isbn: isbn, publication_year: publication_year)
  
    when 3
      puts "Goodbye!"
      break
  
    else
      puts "Invalid choice. Please select a valid option."
    end
  end