class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.text :problem
      t.string :phone
      t.string :email
      t.timestamp :SubmitTime

      t.timestamps
    end
  end
end
