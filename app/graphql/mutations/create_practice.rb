module Mutations
  class CreatePractice < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    graphql_name 'CreatePractice'

    field :practice, Types::PracticeType, null: true
    field :result, Boolean, null: true

    argument :menu_id, ID, required: true
    argument :category, String, required: false
    argument :system, String, required: false
    argument :distance, String, required: false
    argument :times, Int, required: false
    argument :set, Int, required: false
    argument :on_time, String, required: false
    argument :description, String, required: false

    def resolve(**args)
      menu = Menu.find(args[:menu_id])
      practice = menu.practices.build(
        category: args[:category],
        system: args[:system],
        distance: args[:distance],
        times: args[:times],
        set: args[:set],
        on_time: args[:on_time],
        description: args[:description]
      )
      practice.save
      {
        practice: practice,
        result: menu.errors.blank?
      }
    end
  end
end
