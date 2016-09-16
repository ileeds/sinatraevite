class CreateRegistration < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :person_id
      t.string :event_id
      t.string :status
    end
  end
end
