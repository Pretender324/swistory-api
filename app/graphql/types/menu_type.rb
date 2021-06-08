module Types
  class MenuType < Types::BaseObject
    description 'Menu'

    field :id, ID, null: false
    field :level, String, null: true
    field :aim, String, null: true
    field :description, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :practices, [Types::PracticeType], null: true
  end
end
