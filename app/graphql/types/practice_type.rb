module Types
  class PracticeType < Types::BaseObject
    field :id, ID, null: false
    field :category, String, null: true
    field :system, String, null: true
    field :distance, String, null: true
    field :times, Integer, null: true
    field :set, Integer, null: true
    field :on_time, String, null: true
    field :description, String, null: true
    field :menu, Types::MenuType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
