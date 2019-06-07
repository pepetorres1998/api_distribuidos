class AddRankingToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :ranking, :integer
  end
end
