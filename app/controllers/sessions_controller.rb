class SessionsController < ApplicationController
  def create
    auth_cmd = Authentication::AuthenticateUser.call(session_params[:handle])

    if auth_cmd.success?
      @user = auth_cmd.result
      render @user
    else
      render json: { error: auth_cmd.errors[:authentication] }, status: :not_found
    end
  end

  private

  def session_params
    params.require(:session).permit(:handle)
  end
end