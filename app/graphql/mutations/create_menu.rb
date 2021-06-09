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

    argument :group_id, ID, required: true
    argument :level, String, required: true
    argument :aim, String, required: true
    argument :description, String, required: true

    def resolve(**args)
      group = Group.find(args[:group_id])
      menu = group.menus.build(level: args[:level], aim: args[:aim], description: args[:description])
      menu.save
      {
        menu: menu,
        result: menu.errors.blank?
      }
    end
  end
end
