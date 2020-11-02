class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :release_year
      t.string :console
      t.string :genre
      t.string :description
      t.string :developer
      t.boolean :completed
      t.integer :user_id
      t.integer :console_id
    end
  end
end
