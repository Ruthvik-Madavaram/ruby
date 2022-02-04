require_relative 'auth'

teacher_data = {}
student_data = [
  {:name => "Rohan" , :roll_no => 1, subjects: [{:name => "C++", :marks => "not_assigned"}]},
  {:name => "Rahul" , :roll_no => 2, subjects: [{:name => "C++", :marks => "not_assigned"},{:name => "JAVA", :marks => "not_assigned"}]},
  {:name => "Ramya" , :roll_no => 3, subjects: [{:name => "C++", :marks => "not_assigned"},{:name => "Python", :marks => "not_assigned"}]}
]
subject_data = {"C++"=> 100,"Python"=>100,"JAVA"=> 100}
class Teacher
  attr_accessor :name, :email, :password, :students
  include Auth

  def initialize(name,email,password,students)
    @name = name
    @email = email
    @password = password
    @students = students
  end

  def to_s
    return "Name: #{@name}, email: #{@email}"
  end

end

def login(teacher_data,student_data)
  print "Enter your email: "
  email = gets.chomp
  if !teacher_data.has_key?(email)
    puts "Email does not exist, please register"
    return false
  end
  print "Enter Password: "
  password = gets.chomp
  if teacher_data[email].authenticate_user(email,password,teacher_data)
    puts "Log in successfull"
    return true
  end   
end

def register(teacher_data,student_data)
  print "Enter your name: "
  name = gets.chomp
  print "Enter your email: "
  email = gets.chomp
  print "Enter Password: "
  password = gets.chomp
  print "Re-enter password: "
  re_pwd = gets.chomp
  if password != re_pwd
    return "registration unsuccessful because the password did not match"
  end
  if teacher_data[email]
    "Teacher with this email id is already registered."
  end
  registered_teacher = Teacher.new(name,email,password,student_data)
  teacher_data[email] = registered_teacher
  teacher_data[email].password = registered_teacher.create_hash_digest(password)
  puts "registration successful, your details #{teacher_data[email]}"
  return true
end

def gradeStudents(teacher_data,student_data,subject_data)
  no_of_students = student_data.length
  puts "Grade Students: "
  student_data.each do |stu_data|
    stu_data[:subjects].each do |sub_data|
      puts "Grading for #{stu_data[:name]} in #{sub_data[:name]} subject: "
      input_marks = -1
      while true
        input_marks = gets.chomp.to_f
        if subject_data[sub_data[:name]] < input_marks
          puts "Max marks of #{sub_data[:name]} is #{subject_data[sub_data[:name]]}"
        else
          break
        end
      end
      sub_data[:marks] = input_marks
    end
    puts calcPercentage(stu_data[:subjects],subject_data)
  end
end

def calcPercentage(stu_sub_data, subject_data)
  obtained_marks = 0
  total_marks = 0
  stu_sub_data.each do |data| 
    obtained_marks += data[:marks]
    total_marks += subject_data[data[:name]]
  end
  return (obtained_marks/total_marks)*100
end

while true
  puts "Enter 1 to add marks, Enter 2 to update marks, Enter any key to exit"
  user_input = gets.chomp.to_i
  success = false
  if(user_input == 1)
    success = register(teacher_data,student_data)
  elsif(user_input == 2)
    if(teacher_data.length == 0)
      puts "Please register before updating marks"
      break
    end
    success = login(teacher_data,student_data)
  else
    break
  end
  if success
    gradeStudents(teacher_data,student_data,subject_data)
  end
  print "Do you want to continue[Y/N]"
  inp = gets.chomp
  if inp.upcase != "Y"
    break
  end 
end