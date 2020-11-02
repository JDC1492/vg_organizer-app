class RemoveCompletedFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :completed, :boolean
  end
end
