module PostCodes
  class Builder
    attr_reader :code

    def initialize(code)
      @code = code
    end

    def build
      return model(valid: checker.valid?) if validation.success?

      model
    end

    private

    def validation
      @validation ||= Validation.(code: code)
    end

    def checker
      PostCodes::Checker.new(code)
    end

    def model(options = {})
      PostCodes::Struct.new(options.merge(default_model_options))
    end

    def default_model_options
      { code: code }
    end
  end
end
