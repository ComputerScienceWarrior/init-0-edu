
5.times do |i|
    Student.create(firstname: "Student-#{i}", lastname: "Lasty#{i}", username: "super-student-#{i}", email: "student_#{i}@jamesmail.com", password: "pass123")
end

2.times do |i|
    Teacher.create(firstname: "Teacher-#{i}", lastname: "Lasty#{i}", username: "super-teacher-#{i}", email: "teacher_#{i}@jamesmail.edu", password: "pass123")
end

1.times do |i|
    Course.create(title: "course-#{i}", description: "This course is going to teach you all the basics!", teacher_id: 1)
end

2.times do |i|
    Topic.create(title: "Learn to code pt. #{i}", description: "Here is the description on this topic.", course_id: i)
end

