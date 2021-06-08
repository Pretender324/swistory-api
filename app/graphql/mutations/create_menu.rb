module Mutations
  class CreateMenu < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :menu, Types::MenuType, null: false

    argument :level, String, required: true
    argument :aim, String, required: true
    argument :description, String, required: true

    def resolve(**args)
      menu = Menu.create(level: args[:level], aim: args[:aim], description: args[:description])
      {
        menu: menu,
        result: menu.errors.blank?
      }
    end
  end
end
