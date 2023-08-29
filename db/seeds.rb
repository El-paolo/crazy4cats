# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Crear 10 usuarios con datos aleatorios
i = 0
10.times do
    User.create(email: "test#{i}@gmail", password: "asdasdasd",
    password_confirmation: "asdasdasd", name:
    Faker::Name.name)
    i+= 1
    end
  
k=0
10.times do
    Post.create(
      
      title: Faker::Book.title,
      description: Faker::Lorem.paragraphs(number: 2).join("\n\n"),
      image: "https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg",
      user_id: k+= 1
      # Agrega más campos aquí según lo necesites
    )
  end

posts = Post.all
users = User.all
10.times do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200,
    supplemental: false), post_id: posts.sample.id, user_id:
    users.sample.id)
    end