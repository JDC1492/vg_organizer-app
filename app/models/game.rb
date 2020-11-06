class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
    accepts_nested_attributes_for :console
        validates :title, :release_year, :genre, :developer, presence: true
        validates :title, uniqueness: true
        validates :release_year, length: { is: 4, 
        too_short: "%{count} characters is the maximum allowed" }, numericality: { only_integer: true }

       
        def self.ar_completed
            where(complete: true)
        end

        def self.publisher
            where()
        end


        def console_attributes=(console_attribute)
            # binding.pry
                console = Console.find_or_create_by(name:console_attribute[:name])
                self.console = console
                #
        end

end