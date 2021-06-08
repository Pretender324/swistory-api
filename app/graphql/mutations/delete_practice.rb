module Mutations
  class DeletePractice < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    graphql_name 'DeletePractice'

    field :practice, Types::PracticeType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      practice = Practice.find(args[:id])
      practice.destroy
      {
        practice: practice,
        result: practice.errors.blank?
      }
    end
  end
end
