class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, index: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
