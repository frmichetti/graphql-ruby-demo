Types::CountryType = GraphQL::ObjectType.define do
  name "CountryType"

  field :id, types.ID
  field :abbreviation, types.String
  field :name, types.String
end