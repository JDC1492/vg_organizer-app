class ConsolesController < ApplicationController

    def index
        @consoles = current_user.consoles
    end

    def show
        @console = Console.find_by_id(params[:id])
    end

  
    
    def new
        @console = Console.new
    end

    def create
        
    end


    def edit 
        @console = Console.find_by_id(params[:id])
    end

    def update
        
    end

   

    def destroy
        @console = Console.find_by_id(params[:id])
        @console.destroy
    end

end