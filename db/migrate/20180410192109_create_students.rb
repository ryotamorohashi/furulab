class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.integer :year
      t.string :image
      t.text :memo
      t.integer :attend_count, default: 0, null: false
      t.integer :total_time, default: 0, null: false
      t.datetime :entry_time
      t.datetime :exit_time
      t.boolean :are_you_now, default: false, null: false

      t.timestamps
    end
  end
end
