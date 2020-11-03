class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
        validates :title, :release_year, :genre, :developer, presence: true
        validates :title, uniqueness: true
        validates :release_year, length: { is: 4, 
        too_short: "%{count} characters is the maximum allowed" }, numericality: { only_integer: true }


end