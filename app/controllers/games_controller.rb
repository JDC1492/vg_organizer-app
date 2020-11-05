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
        if !current_user.game
            redirect_to games_path
        end
    end
    
    def new
        # binding.pry
        @game = Game.new
        @console = current_user.consoles.order('name ASC').uniq
    end

    def create
        @game = current_user.games.build(game_params)
        if @game.valid?
            binding.pry
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
        if current_user.game
            current_user.game.update(game_params)
             if current_user.game.errors.any?
                render 'edit'
                else
                    redirect_to game_path(@game)
                end
        else 
            render 'edit'
        end
    end

   

    def destroy
        current_user.game.destroy 
         redirect_to games_path
    end



    private
    
    def set_game
        @game = Game.find_by_id(params[:id])
    end
        
    def game_params
        params.require(:game).permit(:title, :release_year, :genre,
        :description, :developer, :complete, console_id:[],  consoles_attributes: [:name])
    end
end