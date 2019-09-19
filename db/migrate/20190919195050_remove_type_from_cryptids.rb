class RemoveTypeFromCryptids < ActiveRecord::Migration[6.0]
  def change

    remove_column :cryptids, :type, :string
  end
end
