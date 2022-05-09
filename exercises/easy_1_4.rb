# Complete this program so that it produces the expected output:

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
Expected output:

The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

=begin
Further Exploration
What do you think of this way of creating and initializing Book objects? (The two steps are separate.)
Would it be better to create and initialize at the same time like in the previous exercise?
What potential problems, if any, are introduced by separating the steps?

### This way provides us more much flexibility to change the state of book at any time. This is probably
not something we want since a book's title and author are typically immutable. If it has a different
title or author, it is a different instance of book.

#Best point from other student:

I'm not sure separating the steps creates a specific problem, but as this code is written it
seems to be pushing against one of the basis for the OOP paradigm... modeling based on "real"
world structure.

Specifically, in this example the book object is created, but becomes dependent on further
action (hard coding the setter method calls) to capture state. This seems unnecessary when the
attributes are available at object creation to define state (author and title).

To my way of thinking, separating the creation and initialization makes more sense if
state can't be, or can only partially determined at creation. Think modeling a pregnancy.
The object is created, but all or part of the state (name, gender, weight, height, etc) probably
can't realistically be determined at that point. Separation as a model might make sense in that case.

=end