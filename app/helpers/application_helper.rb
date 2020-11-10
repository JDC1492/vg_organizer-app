module ApplicationHelper

    def user_check(curent_user)
        if !current_user.name.nil? 
            "Welcome, " + current_user.name 
            else 
            "Welcome, " + current_user.username 
        end 
    end

end
