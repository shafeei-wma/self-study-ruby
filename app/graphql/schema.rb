class Schema < GraphQL::Schema
  query(Types::QueryType) # Step 2
end