module Types
  class MutationType < Types::BaseObject
    field :delete_practice, mutation: Mutations::DeletePractice
    field :update_practice, mutation: Mutations::UpdatePractice
    field :create_practice, mutation: Mutations::CreatePractice
    field :delete_group, mutation: Mutations::DeleteGroup
    field :update_group, mutation: Mutations::UpdateGroup
    field :create_group, mutation: Mutations::CreateGroup
    field :delete_user, mutation: Mutations::DeleteUser
    field :update_user, mutation: Mutations::UpdateUser
    field :create_user, mutation: Mutations::CreateUser
    field :delete_menu, mutation: Mutations::DeleteMenu
    field :update_menu, mutation: Mutations::UpdateMenu
    field :create_menu, mutation: Mutations::CreateMenu
    
  end
end
