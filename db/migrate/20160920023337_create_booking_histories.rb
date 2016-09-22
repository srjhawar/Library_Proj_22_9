class CreateBookingHistories < ActiveRecord::Migration
  def change
    create_table :booking_histories do |t|
      t.integer :booking_id
      t.string :username
      t.integer :room_num
      t.time :start_time
      t.time :end_time
      t.date :date

      t.timestamps null: false
    end
  end
end
