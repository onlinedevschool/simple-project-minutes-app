class CreateClockouts < ActiveRecord::Migration
  def change
    create_table :clockouts do |t|
      t.references :clockin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
