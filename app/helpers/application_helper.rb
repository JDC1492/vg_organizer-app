module ApplicationHelper

    def user_check(curent_user)
        if !current_user.name.nil? 
            current_user.name 
            else 
            current_user.username 
        end 
    end

end
