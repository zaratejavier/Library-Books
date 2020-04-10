# A menu for the user
# a collection of books
# user needs to be able to see available books
# User need to be able to check out books
# User needs to be able to return a book 
#A user needs to be able to see what books they have checked out
#things to note:
# - A use can't check out a book if the book is not available
# - if the user returns a book then the book should become available again

@user_books = []
@librabry_books = {
  the_hobbit: true,
  algorithms_to_live_by: true,
  moby_dick: true,
  flatland: true,
  twilight: true,
  hunger_games: true,
  how_to_win_friend_and_influence_people: true
}

def separator
  puts "*" * 10
  puts
  puts
end

def menu
  separator
  puts "Please Make a selection"
  puts "1) View Available Books"
  puts "2) Checkout A Book"
  puts "3) Return A book"
  puts "4) View Your Boook"
  puts "5) Exit"
end

def user_selection
  menu
  choice = gets.to_i
  case choice
  when 1
    view_books
  when 2
    checkout_book
  when 3
    return_book
  when 4
    view_my_book
  when 5
    puts "Goodbye!"
    Exit
  else
    puts "Invalid Choice Try Again"
  end

  user_selection
end

def print_book_list(list)
  separator
  list.each_with_index {|book, index| puts "#{index + 1}) #{book.to_s.gsub('_', ' ')}".split.map(&:capitalize).join(' ')}
end 

def view_books
  # Create an array of book names where they are available
  # Loop over array and print out book name
  # Users don't know what symbols are how can I print them as strings?
  # What about the underscores?
  books = @librabry_books.select { |_, bookName | bookName == true }.keys
  print_book_list(books)
  books 
end

def view_my_book
  print_book_list(@user_books)
end


def checkout_book
  # view books and print them out with their index in the array
  # ask user to select a book
  # change the availability of that book
  # add book to user array
  # Users don't count starting at 0

  puts "Select a book"
  books = view_books
  choice = gets.to_i

  if choice > 0 && choice <= books.length
    book = books[choice -1]
  else
    puts "Invalid Choice"
    checkout_book
  end

  @librabry_books[book] = false
  @user_books << book
end

def return_book
  # Print out a list of books I have checked out
  # Ask user to select one from the list
  # Remove the book from user inventory
  # Change the availability of the book in library books
  puts "Select a book to return"
  view_my_book
  choice = gets.to_i
  
  if choice > 0 && choice <= @user_books.length
    book = @user_books.delete_at(choice -1)
    @library_books[book] = true
  else
    puts "Invalid Choice"
    return_book
  end
end

  user_selection