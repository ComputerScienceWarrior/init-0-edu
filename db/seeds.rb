# students_email = ["james@gmail.com", "kenny@gmail.com", "kris@gmail.com", "sjones@gmail.com", "justinherbert10@chargers.com"]
# students_username = ["jstampl12", "kennykay87", "kking1387", "starryjones52", "Jherbs10"]
# password = 'james123'
# students_username.each.with_index(0) do |student, i|
#     student = Student.create!(username: students_username[i], email: students_email[i], password: password, is_admin: false)
# end

# #for creating an admin
# student1 = Student.create!(username: "ADMINinit0", email: "james@init-0.edu", password: "james123", is_admin: true)

# course_titles = ["Memoization", "Javascript Algorithms", "C++"]

# course_titles.each do |course|
#     course = Course.create!(title: course, 
#                             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
#                                 eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
#                                 veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea 
#                                 commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit 
#                                 esse cillum dolore eu fugiat nulla pariatur. ."
#                             )
# end

# course_topics = ["Optimization", "Two Number Sum", "Hello world, C++ style"]
# course_topics.each.with_index(0) do |course_topic, k|
#     topic = Topic.create!(title: course_topic, description: "Here is the testing course description.", course_id: "#{k + 1}")
# end

topic_videos = ["Memoization optimization", "Two Number Sum Video", "C++ Viideo"]
video_urls = [
    "https://www.youtube.com/embed/oBt53YbR9Kk&t",
    'https://www.youtube.com/embed/BoHO04xVeU0',
    'https://www.youtube.com/embed/vLnPwxZdW4Y'
    
]
topic_videos.each.with_index(0) do |video_name, l|
    topic = Video.create!(title: video_name, caption: "Video caption #{l + 1}", url: video_urls[l], topic_id: "#{l + 1}")
end