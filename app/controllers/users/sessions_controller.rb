class Users::SessionsController < Devise::SessionsController
  respond_to :json

  before_action :debug_warden

  def debug_warden
    Rails.logger.debug ">> Warden strategies: #{request.env['warden'].config[:default_strategies][:user]}"
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource, status: :ok
  end

  def respond_to_on_destroy
    head :no_content
  end
end
