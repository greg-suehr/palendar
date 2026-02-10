class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description
      t.string :location
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
