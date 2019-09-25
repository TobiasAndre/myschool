# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home; end

  def provider_reports
    @teachers = Teacher.all
    @class_rooms = ClassRoom.all

    @report_records = ClassRoom.includes(:teacher_class_room_disciplines,
                                         :students)

    @class_records = if params[:class_rooms]
                       search(params[:class_rooms])
                     else
                       @class_records = @report_records
    end
  end

  def search(class_room)
    @report_records.where(id: class_room)
  end
end
