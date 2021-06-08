module Mutations
  class UpdateUser < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :user, Types::UserType, null: false

    argument :id, ID, required: true
    argument :name, String, required: true
    argument :sex, String, required: true
    argument :email, String, required: true

    def resolve(**args)
      user = User.find(args[:id])
      user.update(name: args[:name], sex: args[:sex], email: args[:email])
      {
        user: user,
        result: user.errors.blank?
      }
    end
  end
end
