class ConsolesController < ApplicationController
 
    def show
        @console = Console.find_by_id(params[:id])
    end


end