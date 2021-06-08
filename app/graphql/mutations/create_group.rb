module Mutations
  class CreateGroup < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :group, Types::GroupType, null: true
    field :result, Boolean, null: true

    argument :name, String, required: true

    def resolve(**args)
      group = Group.create(name: args[:name])
      {
        group: group,
        result: group.errors.blank?
      }
    end
  end
end
