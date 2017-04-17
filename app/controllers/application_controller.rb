# Parent class for all the controllers. Shared code between controllers
# must be placed here.
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :show_empty_json

  def show_empty_json
    render json: ''
  end
end
