class GamesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_game, only: [:show, :edit, :update, :destroy]

    def index 
        if !authenticate_user!
            redirect_to user_session_path
        else
        @games = current_user.games
        @consoles = current_user.consoles
        end
    end

    def show
        if @game.user_id != current_user.id
            redirect_to games_path
        end
    end
    
    def new
        @game = Game.new
    end

    def create
        @game = current_user.games.build(game_params)
    #    binding.pry 
        if @game.save
            redirect_to game_path(@game)
        else 
            render :new
        end
    end

    def edit
        if @game.user_id != current_user.id
            redirect_to games_path
        end
    end

    def update
        if @game && @game.user_id == current_user.id
            @game.update(game_params) 
            binding.pry
        if @game.errors.any?
            render :edit
        else
            redirect_to game_path(@game)
            end
        else 
            render :edit
        end
    end

   

    def destroy
        if @game.user_id == current_user.id
           @game.destroy 
            redirect_to games_path
        else 
            redirect_to games_path
        end
    end

    def complete
        @complete = current_user.games.ar_completed
    end



private
    
    def set_game
        @game = Game.find_by_id(params[:id])
    end
        
    def game_params
        params.require(:game).permit(:title, :release_year, :genre,
        :description, :developer, :complete, console_id:[], console_attributes: [:id, :name ])  
    end

end
