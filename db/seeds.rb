# for user_table (change only roles)
20.times do
  User.create(email: Faker::Internet.email, password_digest: "dev123", role: "admin`")
end 

i = 20
for i in 20..40
  i = i+1
  Teacher.create(name: Faker::Name.name, gender: 'male', date_of_birth: 'Wed, 13 Sep 2023 16:53:25.768381000 UTC +00:00', salery: 100, subject_name: 'english', user_id: i, contact_number: 123, address: 'kerla') 
end

  # Student.create(name: Faker::Name.name, father_name: Faker::Name.name, gender: 'male', date_of_birth: 'Wed, 13 Sep 2023 16:53:25.768381000 UTC +00:00', roll_no: i, user_id: i, contact_number: 123, address: 'indore') 

