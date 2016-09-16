class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.integer :zip_code
    end
  end
end
