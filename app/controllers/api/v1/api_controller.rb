class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :return_404

  private

  def return_404
    render status: 404, json: { error: 'not found' }
  end
end
