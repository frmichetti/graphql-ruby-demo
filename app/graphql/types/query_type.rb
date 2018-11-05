Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :hello, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  # chamamos o field de "user" e ele terá um
  # namespace chamado "Types" que chamamos
  # de "UserType" e ficará em
  end

  # app/graphql/types/user_type.rb
    field :user, Types::UserType do
      # passamos aqui o "id" do User como argumento de consulta
      # esse valor de "id" vem do front-end para o back-end
      argument :id, types.ID # o "id" tem um tipo especial chamado ID
      description "Identificação do Usuário"

      # aqui é o método chamado "resolve" que resgata
      # os dados de User do banco de dados
      resolve -> (obj, args, ctx) {
        User.where(id: args[:id]).first
        # puts ctx.query.query_string
      }
    end

  field :users, !types[Types::UserType] do
    # aqui é o método chamado "resolve" que resgata
    # os dados de User do banco de dados
    resolve -> (obj, args, ctx) {
      User.all
      # puts ctx.query.query_string
    }
  end
end

