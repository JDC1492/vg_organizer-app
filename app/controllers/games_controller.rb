class GamesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_game, only: [:show, :edit, :update, :destroy]

    def index 
        # binding.pry
        if !authenticate_user!
            redirect_to user_session_path
        elsif
            @games = current_user.games
            @consoles = current_user.consoles
        end
        if params[:search] #if there is a search
            @games = current_user.games.search(params[:search].downcase)
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
        #POST
        @game = current_user.games.build(game_params)
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
           #PATCH
        if @game && @game.user_id == current_user.id
            @game.update(game_params) 
            # binding.pry
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
        if @game && @game.user_id == current_user.id
           
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
        params.require(:game).permit(:search, :title, :release_year, :genre,
        :description, :developer, :complete, console_id:[], console_attributes: [:name])
    end
end
