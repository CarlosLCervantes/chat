class RoomMessagesController < ApplicationController
  def create
    # TODO: Validations/etc
    # user = User.find(params[:user_id])
    # room = Room.find(params[:room_id])

    @room_user = RoomUser.find(room_message_params[:user_room_id])
    message = room_message_params[:messages]

    #TODO: Cleanup
    RoomMessage.create!(room_user: @room_user, message: message)

    render json: { success: true }
  end

  private

  def room_message_params
    params.require(:room_message).permit(:user_room_id, :message)
  end
end