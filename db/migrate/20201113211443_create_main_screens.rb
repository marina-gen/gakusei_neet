class CreateMainScreens < ActiveRecord::Migration[6.0]
  def change
    create_table :main_screens do |t|
      
      t.timestamps
    end
  end
end
