# Define a query type
module Types
  class QueryType < GraphQL::Schema::Object
    description "The query root of this schema"

    field :user, UserType, null: true do # Step 3 - set potential param for argument from API
      description "Find a user by ID"
      argument :id, ID, required: true
      argument :username, String, required: false
    end

    field :userSpecial, UserSpecialType, null: true do # Step 3 - set potential param for argument from API
      description "Find a user by ID plus category"
      argument :id, ID, required: true
      argument :username, String, required: false
    end

    field :post, [PostType], null: true do # Step 3 - set potential param for argument from API AND return array of sets data
      description "Find a post by user user ID"
      argument :userId, ID, required: true
    end

    def userSpecial(id:,username:) # Step 4
      User.find(id)
    end

    def user(id:,username:) # Step 4
      # { id: "1", username: "Category Name", email: "wms@fgmai.com"} # Mockup example if not return actual data
      User.find(id)
    end

    def post(userId:) # Step 4
      Post.where(user_id: userId)
    end
  end
end