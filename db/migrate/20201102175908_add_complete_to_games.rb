class AddCompleteToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :complete, :boolean, default: false
  end
end
