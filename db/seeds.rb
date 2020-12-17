
student = Student.create!(firstname: "James", lastname: "Stampley", username: "username", email: "james@gmail.com", password: "pass123")
course = Course.create!(title: "Data Structures and Algorithms", description: "This course is going to teach you all the basics of DS and Algorithms!", teacher_id: 1)
topic = Topic.create!(title: "Arrays Pt.1", description: "This course will cover the S/T complexity of the Array DS.", course_id: 1)


