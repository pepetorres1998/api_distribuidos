class AddVersionToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :version, :string
  end
end
