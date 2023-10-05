require './person'
require './classroom'
require './book'
require './rental'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student_1 = Student.new("room1", 22, "Tan")
puts student_1 = Student.new("room1", 22, "Tan")
puts "student one name: #{student_1.name}, classroom: #{student_1.classroom}"

new_classroom = Classroom.new("New class")
puts new_classroom
puts new_classroom.label
new_classroom.add_student(student_1)
puts "student one name: #{student_1.name}, classroom: #{student_1.classroom.label}"

student_2 = Student.new("New class", 19, "Dee")
puts "student one name: #{student_2.name}, classroom: #{student_2.classroom}"

puts "Count of student in classroom - New class: #{new_classroom.students.count}"

new_classroom.add_student(student_2)
puts "count after adding new student"
puts "Count of student in classroom - New class: #{new_classroom.students.count}"

book_1 = Book.new("Title one", "Author one")
book_1.add_rental(student_1, "2023-10-06")
book_1.add_rental(student_2, "2023-10-06")

# rental_1 = Rental.new("2023-10-06", book_1, student_1)
# rental_2 = Rental.new("2023-10-06", book_1, student_2)

puts "book 1 name: #{book_1.title}, rentals: #{book_1.rentals.count}"
puts "student 1 rentals: #{student_1.rentals.count}"