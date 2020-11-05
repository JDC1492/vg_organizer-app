class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
        validates :title, :release_year, :genre, :developer, presence: true
        validates :title, uniqueness: true
        validates :release_year, length: { is: 4, 
        too_short: "%{count} characters is the maximum allowed" }, numericality: { only_integer: true }

       
        
        def consoles_attributes=(console_attributes)
            console_attributes.values.each do |console_attribute|
                console = Console.find_or_create_by(console_attribute)
                self.console << console
                
            end
        end

end