class CreateLabStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_statuses do |t|
      t.boolean :light_entry
      t.datetime :entry_time
      t.datetime :exit_time

      t.timestamps
    end
  end
end
