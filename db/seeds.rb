students_email = ["james@gmail.com", "kenny@gmail.com", "kris@gmail.com", "sjones@gmail.com", "justinherbert10@chargers.com"]
students_username = ["jstampl12", "kennykay87", "kking1387", "starryjones52", "Jherbs10"]
password = 'james123'
students_username.each.with_index(0) do |student, i|
    student = Student.create!(username: students_username[i], email: students_email[i], password: password, is_admin: false)
end

#for creating an admin
student1 = Student.create!(username: "ADMINinit0", email: "james@init-0.edu", password: "james123", is_admin: true)

course_titles = ["DFS / BFS", "Memoization", "Hash Dash", "C++17 Full Course", "Basic Math"]

course_titles.each.with_index(0) do |course, j|
    course = Course.create!(title: course_titles[j], 
                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
                                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                                veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea 
                                commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit 
                                esse cillum dolore eu fugiat nulla pariatur. ."
                            )
end