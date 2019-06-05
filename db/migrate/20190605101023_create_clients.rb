class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :ip
      t.string :cpu
      t.string :ram
      t.boolean :server
      t.boolean :active

      t.timestamps
    end
  end
end
