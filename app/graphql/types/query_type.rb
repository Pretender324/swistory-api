module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # menu
    field :menus, [Types::MenuType], null: false
    def menus
      Menu.all
    end

    field :menu, Types::MenuType, null: false do
      argument :id, Int, required: false
    end
    def menu(id:)
      Menu.find(id)
    end

    # user
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, Int, required: false
    end
    def user(id:)
      User.find(id)
    end
  end
end
