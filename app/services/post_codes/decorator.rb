module PostCodes
  class Decorator
    attr_reader :model

    delegate :code, :valid, to: :model

    def initialize(model)
      @model = model
    end

    def validity
      valid ? 'allowed' : 'not allowed'
    end
  end
end
