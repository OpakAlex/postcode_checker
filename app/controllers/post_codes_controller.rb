class PostCodesController < ApplicationController
  def index; end

  def create
    model = builder.build
    respond_to do |format|
      format.js { @model = decorate!(model) }
    end
  end

  private

  def decorate!(model)
    PostCodes::Decorator.new(model)
  end

  def permitted_params
    params.permit(:code)
  end

  def builder
    PostCodes::Builder.new(permitted_params[:code]&.strip)
  end
end
