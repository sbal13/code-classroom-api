class Api::V1::RoomsController < ApplicationController
  before_action :authorize, only: [:update]
  def index
    rooms = Room.all
    render json: rooms
  end

  def show
    room = Room.find_by(id: params[:id])
    render json: room
  end

  def update
    room = Room.find(params[:id])


    if admin?
      room.update(room_params)

      RoomsChannel.broadcast_to(room, { type: "UPDATE_ROOM", payload: RoomSerializer.new(room)})

      render json: room
    else
      render json: {errors: "Unauthorized user"}, status: 403
    end

  end

  def create
    room = Room.new(room_params)

    if room.save
      render json: room
    else
      render json: {errors: room.errors.full_messages}
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :code, :language, :cohort_id)
  end
end
