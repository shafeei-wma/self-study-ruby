# Define a type for the User and all allowed column for it
module Types
  class UserSpecialType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :username, String, null: true
    field :email, String, null: true
    field :category, String, null: true

    def category
      # Here you can return the additional category hash for the user.
      # This is a mockup, replace it with your actual logic.
      # { id: "1", name: "Category Name" } # also can use json to return
      res = "Sample added category"
      res
    end

  end
end