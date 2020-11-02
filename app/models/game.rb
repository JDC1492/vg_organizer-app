class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
        validates :title, :release_year, :genre, :developer, presence: true

end