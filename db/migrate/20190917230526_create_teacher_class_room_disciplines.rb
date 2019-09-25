# frozen_string_literal: true

class CreateTeacherClassRoomDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_class_room_disciplines do |t|
      t.references :class_room, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :discipline, foreign_key: true
      t.timestamps
    end
  end
end
