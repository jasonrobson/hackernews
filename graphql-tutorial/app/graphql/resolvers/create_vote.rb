class Resolvers::CreateVote < GraphQL::Function
    argument :linkId, types.ID
  
    type Types::VoteType
  
    def call(_obj, args, ctx)
        # puts "Argumentos:", args.to_json
        # puts args[:linkId]
        puts Link.find_by(id: args[:linkId])
      Vote.create!(
        link: Link.find_by(id: args[:linkId]),
        user: ctx[:current_user]
      )
    end
  end