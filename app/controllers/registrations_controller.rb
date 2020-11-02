class RegistrationsController < Devise::RegistrationsController
    
    def new

    end



    
    private
        def sign_up_params
            params.require(:user).permit(:name, :username, :email, :passoword, :password_confirmation)
        end

        def account_update_params
            params.require(:user).permit(:name, :username, :email, :passoword, :password_confirmation, :current_password)
        end

end