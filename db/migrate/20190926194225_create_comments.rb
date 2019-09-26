class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user
      t.belongs_to :cryptid
    end
  end
end
