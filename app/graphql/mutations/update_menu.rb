module Mutations
  class UpdateMenu < BaseMutation
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
    argument :level, String, required: false
    argument :aim, String, required: false
    argument :description, String, required: false

    def resolve(**args)
      menu = Menu.find(args[:id])
      menu.update(level: args[:level], aim: args[:aim], description: args[:description])
      {
        menu: menu,
        result: menu.errors.blank?
      }
    end
  end
end
