module Mutations
  class DeleteMenu < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :menu, Types::MenuType, null: false

    argument :id, ID, required: true

    def resolve(**args)
      menu = Menu.find(args[:id])
      menu.destroy
      {
        menu: menu,
        result: menu.errors.blank?
      }
    end
  end
end
