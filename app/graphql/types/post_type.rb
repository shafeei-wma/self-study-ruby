# Define a type for the User and all allowed column for it
module Types
  class PostType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :title, String, null: true
    field :content, String, null: true
    field :ref1, String, null: true
    field :ref2, String, null: true
    field :media, String, null: true
    field :user_id, ID, null: false
  end
end