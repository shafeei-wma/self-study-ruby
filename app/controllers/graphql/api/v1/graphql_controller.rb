class Graphql::Api::V1::GraphqlController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index

    # Example from source if test default params
    # params = {
    #   "query": "query getPosts($userId: ID!) { post(userId: $userId) { title, content, media, ref1, ref2 } }",
    #   "variables": {
    #     "userId": 2
    #   }
    # }
    # Advanced schema, no need now
    # operation_name = params[:operationName]
    # context = {
    #   # Query context goes here, for example:
    #   # current_user: current_user,
    # }
    variables = ensure_hash(params[:variables])
    query = params[:query]
    result = Schema.execute(query, variables: variables)
    # result = Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render status: :ok, json: result
  end

  def public_ensure_hash(ambiguous_param)
    ensure_hash(ambiguous_param)
  end

  private

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
end