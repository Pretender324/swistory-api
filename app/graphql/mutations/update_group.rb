module Mutations
  class UpdateGroup < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :group, Types::GroupType, null: false

    argument :id, ID, required: true
    argument :name, String, required: false

    def resolve(**args)
      group = Group.find(args[:id])
      group.update(name: args[:name])
      {
        group: group,
        result: group.errors.blank?
      }
    end
  end
end
