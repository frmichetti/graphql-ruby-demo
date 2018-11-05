Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :hello, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :createUser, function: Mutations::CreateUser.new
end
