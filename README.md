# library-catalog

Project Idea: Online Library Catalog

Description:
Create a basic online library catalog system that allows users to view and search for books. The system should also support adding new books to the catalog.

Application Structure:

Single Responsibility Principle (SRP): Ensure that each class in your project adheres to the SRP.

Create a Book class that represents a book with attributes like title, author, ISBN, and publication year.
Implement a LibraryCatalog class that manages the catalog of books. It should be responsible for adding books and searching for books based on various criteria (e.g., title, author).


Open/Closed Principle (OCP): Design your classes in a way that allows for extension but prevents modification.

Use inheritance to allow for future extensions of book types (e.g., FictionBook, NonFictionBook, ScienceFictionBook) without modifying existing code.


Liskov Substitution Principle (LSP): Ensure that subtypes are substitutable for their base types without altering the correctness of the program.

If you have subclasses of Book, make sure they can be used interchangeably with the base Book class.


Interface Segregation Principle (ISP): Clients should not be forced to depend on interfaces they do not use.

Create specific interfaces for different types of operations (e.g., Catalogable for adding books, Searchable for searching) and make sure classes implement only the interfaces they need.


Dependency Inversion Principle (DIP): High-level modules should not depend on low-level modules; both should depend on abstractions.

Implement abstractions (interfaces or abstract classes) for the interactions between high-level modules (e.g., the user interface) and low-level modules (e.g., the database or book storage).

Functionality:

Users can view a list of books in the catalog.
Users can search for books by title, author, ISBN, or any other relevant criteria.
Users can add new books to the catalog.
Implement a simple user interface (command line or web-based) to interact with the library catalog.

By designing your library catalog system with the SOLID principles in mind, you will create a more maintainable, extensible, and robust software application. Additionally, you'll gain valuable experience in applying these principles in a real-world context.
