module Mutations
  class UpdatePractice < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    graphql_name 'UpdatePractice'

    field :practice, Types::PracticeType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :category, String, required: false
    argument :system, String, required: false
    argument :distance, String, required: false
    argument :times, Int, required: false
    argument :set, Int, required: false
    argument :on_time, String, required: false
    argument :description, String, required: false

    def resolve(**args)
      practice = Practice.find(args[:id])
      practice.update(
        category: args[:category],
        system: args[:system],
        distance: args[:distance],
        times: args[:times],
        set: args[:set],
        on_time: args[:on_time],
        description: args[:description]
      )
      {
        practice: practice,
        result: practice.errors.blank?
      }
    end
  end
end
