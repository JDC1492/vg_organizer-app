class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
        validates :title, :release_year, :console, :genre, :developer, :completed, presence: true

end