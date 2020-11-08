module PostCodes
  module Types
    include Dry.Types()

    Code = Types::String.constructor(&:strip)
  end

  UK_POST_CODE_REGEXP = /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/.freeze

  Validation = Dry::Schema.Params do
    required(:code).value(Types::Code, min_size?: 3, format?: UK_POST_CODE_REGEXP)
  end
end
