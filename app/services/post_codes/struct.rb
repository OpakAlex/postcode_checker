module PostCodes
  class Struct < Dry::Struct
    module Types
      include Dry.Types()
    end

    attribute :code, Types::String
    attribute :valid, Types::Bool.default(false)
  end
end
