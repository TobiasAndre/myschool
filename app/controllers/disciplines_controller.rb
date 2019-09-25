# frozen_string_literal: true

class DisciplinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discipline, only: %i[show edit update destroy]

  def index
    @disciplines = Discipline.all
  end

  def show; end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.create(discipline_params)
    if @discipline.save!
      redirect_to disciplines_path
    else
      render :new
    end
  end

  def update
    if @discipline.update_attributes(discipline_params)
      redirect_to disciplines_path
    else
      render :edit
    end
  end

  def destroy
    if @discipline.destroy!
      redirect_to disciplines_path
    else
      render :index
    end
  end

  private

  def set_discipline
    @discipline = Discipline.find(params[:id])
  end

  def discipline_params
    params.require(:discipline).permit(:name)
  end
end
