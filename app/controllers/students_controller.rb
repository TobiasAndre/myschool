# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def show; end

  def new
    @class_rooms = ClassRoom.all
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.save!
      redirect_to students_path
    else
      render :new
    end
  end

  def update
    if @student.update_attributes(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  def destroy
    if @student.destroy!
      redirect_to students_path
    else
      render :index
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :class_room_id)
  end
end
