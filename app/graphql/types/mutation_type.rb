module Types
  class MutationType < Types::BaseObject
    field :delete_user, mutation: Mutations::DeleteUser
    field :update_user, mutation: Mutations::UpdateUser
    field :create_user, mutation: Mutations::CreateUser
    field :delete_menu, mutation: Mutations::DeleteMenu
    field :update_menu, mutation: Mutations::UpdateMenu
    field :create_menu, mutation: Mutations::CreateMenu
    
  end
end
