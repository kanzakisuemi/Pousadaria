class Api::V1::InnRoomsController < Api::V1::ApiController
  before_action :set_room, only: %i[ show ]

  def show
    render 200, json: @inn_room.as_json(except: [:created_at, :updated_at])
  end

  private

  def set_room
    @inn_room = InnRoom.find(params[:id])
  end

end
