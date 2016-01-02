module RescueFrom
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound,       with: :not_found
    rescue_from ActionController::ParameterMissing, with: :missing_param_error
    rescue_from ActiveRecord::InvalidForeignKey,    with: :invalid_foreign_key
    rescue_from ActiveRecord::RecordNotSaved,       with: :not_saved
  end

  def not_found(exception)
    render status: :not_found, json: { error: exception.message }
  end

  def missing_param_error(exception)
    render status: :unprocessable_entity, json: { error: exception.message }
  end

  def invalid_foreign_key(exception)
    render status: :unprocessable_entity, json: { error: exception.message }
  end

  def not_saved(exception)
    render status: :unprocessable_entity, json: { error: exception.message }
  end
  
end