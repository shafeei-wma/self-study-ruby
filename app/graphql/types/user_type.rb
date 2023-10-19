# Define a type for the User and all allowed column for it
module Types
  class UserType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :username, String, null: true
    field :email, String, null: true
  end
end