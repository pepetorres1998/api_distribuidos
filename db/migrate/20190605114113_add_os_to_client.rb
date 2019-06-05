class AddOsToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :os, :string
  end
end
