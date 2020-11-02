class GamesController < ApplicationController


    def index
        @games = Game.all
    end

    def show
        @game = Game.find_by_id(params[:id])
    end

  
    
    def new
        
    end

    def create
        
    end


    def edit
        @game = Game.find_by_id(params[:id])

    end

    def update
        
    end

   

    def destroy
        @game = Game.find_by_id(params[:id])
        
    end


end