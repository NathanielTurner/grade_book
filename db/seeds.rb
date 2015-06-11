(1..20).each do
  Grade.create(assignment: Faker::Lorem.sentence(word_count=4), grade: rand(45..100),
               student_id: rand(1..4))
end

(1..4).each do
  n = Faker::Name.name
  Student.create!(name: n, email: Faker::Internet.safe_email(n),
                 password: 'secret', teacher_id: rand(1..10))
end

Teacher.create(name: "Nate", email: "nateturner1990@gmail.com", password: "firecracker",
               )
Parent.create(name: "Bobby", email: "bobby@example.com", password: "firecracker",
              student_id: 2)
