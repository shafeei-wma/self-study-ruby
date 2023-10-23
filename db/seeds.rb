# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: 'wmshafeei@gmail.com')
  User.create!(
    email: 'wmshafeei@gmail.com',
    password: 'Passw0rd',
    username: 'pie_93'
  )
end

unless Post.exists?(id: 1)
  Post.create!(
    title: 'How to fix pc in 5 mins!',
    content: 'This is content for how to fix...',
    media: 'ameracano.png',
    user_id: 2,
    ref1: 'https://www.google,com'
  )
end
puts "done seed!"

# Execute the GraphQL query
result = Schema.execute('{ user(id: 1,username: "pie_93") { username, email } }') # Step 1 - User define table/field they want and returned result
puts result.inspect

# Execute the GraphQL query 2
result = Schema.execute('{ userSpecial(id: 1,username: "pie_93") { username, email,category } }') # Step 1 - User define table/field they want and returned result
puts result.inspect

# Execute the GraphQL query 3
params = {
  "query": "query getPosts($userId: ID!) { post(userId: $userId) { title, content, media, ref1, ref2 } }",
  "variables": {
    "userId": 2
  }
}

variables = Graphql::Api::V1::GraphqlController.new.public_ensure_hash(params[:variables])
query = params[:query]
result = Schema.execute(query, variables: variables)
# OR result = Schema.execute('{ post(userId: 2) { title, content,media,ref1,ref2 } }') # Step 1 - User define table/field they want and returned result
puts result.inspect

