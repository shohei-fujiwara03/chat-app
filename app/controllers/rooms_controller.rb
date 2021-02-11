class RoomsController < ApplicationController

  def new
  @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
    # Railsではセキュリティ対策として、保存する前にストロングパラメーターを使い、許可するパラメーターを指定してから、データを保存するよう推奨されている。
  end

end
