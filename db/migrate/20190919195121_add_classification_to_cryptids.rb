class AddClassificationToCryptids < ActiveRecord::Migration[6.0]
  def change
    add_column :cryptids, :classification, :string
  end
end
