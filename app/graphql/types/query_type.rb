Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :hello, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

    field :user, Types::UserType do
      argument :id, types.ID
      description "Identificação do Usuário"

      resolve -> (obj, args, ctx) {
        User.find_by(id: args[:id])
      }
    end

  field :country, Types::CountryType do
    argument :id, types.ID
    description "Identificação do País"

    resolve -> (obj, args, ctx) {
      Country.find_by(id: args[:id])
    }
  end

  field :users, !types[Types::UserType] do
    resolve -> (obj, args, ctx) {
      User.all
    }
  end

  field :countries, !types[Types::CountryType] do
    resolve -> (obj, args, ctx) {
      Country.all
    }
  end
end

