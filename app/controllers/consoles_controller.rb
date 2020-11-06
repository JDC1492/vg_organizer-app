class ConsolesController < ApplicationController
 
    def show
        @console = current_user.consoles.find_by_id(params[:id])
    end


end