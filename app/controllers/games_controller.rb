class GamesController < ApplicationController

    def index
        @games = current_user.games
        @consoles = current_user.consoles
    end

    def show
        @game = Game.find_by_id(params[:id])
    end

  
    
    def new
        
        @game = Game.new
    end

    def create
        binding.pry
    end


    def edit
        @game = Game.find_by_id(params[:id])

    end

    def update
        
    end

   

    def destroy
        @game = Game.find_by_id(params[:id])
        
    end


    private
    
    def set_game
        @game = Game.find_by_id(params[:id])
    end
        
    def game_params
        params.require(:game).permit(:title, :release_year, :genre,
             :description, :dveloper, :complete)
    end
end