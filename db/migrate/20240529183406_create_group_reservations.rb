class CreateGroupReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_reservations do |t|
      t.string :name
      t.date :check_in_date
      t.date :check_out_date
      t.references :inn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
