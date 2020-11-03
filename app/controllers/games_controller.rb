class GamesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_game, only: [:show, :edit, :update, :destroy]

    def index
        @games = current_user.games
        @consoles = current_user.consoles
        if !authenticate_user!
            redirect_to user_session_path
        end
    end


    def show
        if !@game
            redirect_to games_path
        end
    end

  
    
    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)
        binding.pry
        if @game.valid?
            @game.save
            redirect_to game_path(@game)
        else 
            render 'new'
        end
    end


    def edit
        # @game = Game.find_by_id(params[:id])
        if !@game
            redirect_to games_path
        end
    end

    def update
        if @game
            @game.update(game_params) 
            redirect_to game_path(@game)
        else 
            render 'edit'
        end
    end

   

    def destroy
        # @game = Game.find_by_id(params[:id])  
    end



    private
    
    def set_game
        @game = Game.find_by_id(params[:id])
    end
        
    def game_params
        params.require(:game).permit(:title, :release_year, :genre,
             :description, :developer, :complete)
    end
end