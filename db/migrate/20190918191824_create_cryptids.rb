class CreateCryptids < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptids do |t|
      t.string :name
      t.string :location
      t.string :size
      t.string :type
    end
  end
end
