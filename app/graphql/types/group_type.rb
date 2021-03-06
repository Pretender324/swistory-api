module Types
  class GroupType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :menus, [Types::MenuType], null: true
  end
end
