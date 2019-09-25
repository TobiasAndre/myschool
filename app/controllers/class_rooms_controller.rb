# frozen_string_literal: true

class ClassRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_class_room, only: %i[show edit update destroy]

  def index
    @class_rooms = ClassRoom.all
  end

  def new
    @class_room = ClassRoom.new
    @teachers = Teacher.all
    @disciplines = Discipline.all
  end

  def create
    @class_room = ClassRoom.create(set_class_room_params)
    if @class_room.save!
      redirect_to class_rooms_path
    else
      render :new
    end
  end

  def update
    if @class_room.update_attributes(set_class_room_params)
      redirect_to class_rooms_path
    else
      render :edit
    end
  end

  def destroy
    if @class_room.destroy!
      redirect_to class_rooms_path
    else
      render :index
    end
  end

  private

  def set_class_room
    @teachers = Teacher.all
    @disciplines = Discipline.all
    @class_room = ClassRoom.find(params[:id])
  end

  def set_class_room_params
    params.require(:class_room)
          .permit(:id, :name, teacher_class_room_disciplines_attributes: %i[id teacher_id classs_room_id discipline_id _destroy])
  end
end
