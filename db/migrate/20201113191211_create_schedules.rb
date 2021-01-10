class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.datetime :startdate
      t.datetime :enddate
      t.integer :allday
      t.text :memo
      t.timestamps
    end
  end
end
