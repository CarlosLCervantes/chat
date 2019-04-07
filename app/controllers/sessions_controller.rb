class SessionsController < ApplicationController
  def create
    command = Authentication::AuthenticateUser.call(session_params[:handle])

    if command.success?
      @user = command.result
      render @user
    else
      byebug
      render json: { error: command.errors[:authentication] }, status: :not_found
    end
  end

  private
  def session_params
    params.require(:session).permit(:handle)
  end
end