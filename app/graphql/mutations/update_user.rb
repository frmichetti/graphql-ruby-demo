class Mutations::UpdateUser < GraphQL::Function
  argument :id, types.ID
  argument :name, types.String
  argument :email, types.String
  argument :phone_number, types.Int
  argument :is_admin, types.Boolean
  argument :country_id, types.Int

  type Types::UserType # especificação do tipo de retorno

  def call(obj, args, context)
    fields = {
        name: args[:name],
        email: args[:email],
        phone_number: args[:phone_number],
        is_admin: args[:is_admin],
        country_id: args[:country_id]
    }
    user = User.find_by(id: args[:id])
    raise ArgumentError.new("Usuário não encontrado") unless user
    user.update(fields)
    user
  end
end