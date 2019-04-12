class SessionsController < ApplicationController
  def create
    auth_cmd = Authentication::AuthenticateUser.call(session_params[:handle])

    if auth_cmd.success?
      data = auth_cmd.result
      @user = data[:user]
      @room = data[:room]
      @rooms_user = data[:rooms_user]

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