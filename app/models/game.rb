class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :console
    # accepts_nested_attributes_for :console
        validates :title, :release_year, :genre, :developer, presence: true
        validates :title, uniqueness: true
        validates :release_year, length: { is: 4, too_short: "%{count} characters is the maximum allowed" }, numericality: { only_integer: true }

        scope :ar_completed, -> {  where(complete: true) }
        
        #method used to query the database
        def self.search(params)
            # making use of LOWER to lowercase the titles of the selected games, and the ? placeholder for what the params may be
                where("LOWER(title) LIKE ?", "%#{params}%")
        end
        

    
                
        
        #custom nested attr. writer, also added to my strong params.
        def console_attributes=(console_attribute)
            # binding.pry <- used to check console_attributes
                console = Console.find_or_create_by(name:console_attribute[:name])
                self.console_id = console.id
        end

end