class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.string :name      
      t.datetime :date
      t.string :note
      t.belongs_to :user
      t.belongs_to :cryptid
    end
  end
end
