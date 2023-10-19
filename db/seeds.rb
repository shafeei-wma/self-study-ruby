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

# Execute the query
result = Schema.execute('{ user(id: 1,username: "pie_93") { username, email } }') # Step 1 - User define table/field they want and returned result
puts result.inspect

# Execute the query 2
result = Schema.execute('{ userSpecial(id: 1,username: "pie_93") { username, email,category } }') # Step 1 - User define table/field they want and returned result
puts result.inspect

 # Handle form data, JSON body, or a blank value
 def ensure_hash(ambiguous_param)
  case ambiguous_param
  when String
    if ambiguous_param.present?
      ensure_hash(JSON.parse(ambiguous_param))
    else
      {}
    end
  when Hash, ActionController::Parameters
    ambiguous_param
  when nil
    {}
  else
    raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
  end
end

# Execute the query 3
result = Schema.execute('{ post(userId: 2) { title, content,media,ref1,ref2 } }') # Step 1 - User define table/field they want and returned result
# params = {
#   "query": "query getPosts($userId: ID!) { post(userId: $userId) { title, content, media, ref1, ref2 } }",
#   "variables": {
#     "userId": 2
#   }
# }
# variables = ensure_hash(params[:variables])
# query = params[:query]
# result = Schema.execute(query, variables: variables)
puts result.inspect

