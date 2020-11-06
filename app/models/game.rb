class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
    # accepts_nested_attributes_for :console
        validates :title, :release_year, :genre, :developer, presence: true
        validates :title, uniqueness: true
        validates :release_year, length: { is: 4, 
        too_short: "%{count} characters is the maximum allowed" }, numericality: { only_integer: true }

        scope :in_alph_order, -> {order(:title, :asc)}
        scope :fav_genre, -> (name) { where(genre: name) }
        # scope :dev_count, -> { where(count(:developer), :asc, limit 1) }
        scope :ar_completed, -> {  where(complete: true) }
        scope :need_to_finish, -> {  where(complete: false) }

        def console_attributes=(console_attribute)
            # binding.pry <- used to check console_attributes
                console = Console.find_or_create_by(name:console_attribute[:name])
                self.console_id = console.id
        end

end