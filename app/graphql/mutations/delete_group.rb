module Mutations
  class DeleteGroup < BaseMutation
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

    def resolve(**args)
      group = Group.find(args[:id])
      group.destroy
      {
        group: group,
        result: group.errors.blank?
      }
    end
  end
end
