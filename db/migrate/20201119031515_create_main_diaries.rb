class CreateMainDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :main_diaries do |t|
      t.date :today, null: false , unique: true
      t.text :diary, null: false
      t.timestamps
    end
  end
end
