module Types
  class MutationType < Types::BaseObject
    field :delete_menu, mutation: Mutations::DeleteMenu
    field :update_menu, mutation: Mutations::UpdateMenu
    field :create_menu, mutation: Mutations::CreateMenu
    
  end
end
