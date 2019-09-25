# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.integer :age, default: 0
      t.references :class_room, foreign_key: true
      t.timestamps
    end
  end
end
