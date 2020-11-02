class RemoveConsoleFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :console, :string
  end
end
