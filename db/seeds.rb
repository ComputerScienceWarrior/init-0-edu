students_firstname = ["James", "Kenny", "Kris"]
students_lastname = ["Stampley", "Kay", "King"]
students_email = ["james@gmail.com", "kenny@gmail.com", "kris@gmail.com"]
students_username = ["jstampl12", "kennykay87", "kking13"]

students_firstname.each.with_index(0) do |student, i|
    student = Student.create!(firstname: students_firstname[i], lastname: students_lastname[i], username: students_username[i], email: students_email[i], password: "1", is_admin: false)
end


