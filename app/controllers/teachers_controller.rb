# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: %i[show edit update destroy]

  def index
    @teachers = Teacher.all
  end

  def show; end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    if @teacher.save!
      redirect_to teachers_path
    else
      render :new
    end
  end

  def update
    if @teacher.update_attributes(teacher_params)
      redirect_to teachers_path
    else
      render :edit
    end
  end

  def destroy
    if @teacher.destroy!
      redirect_to teachers_path
    else
      render :index
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
