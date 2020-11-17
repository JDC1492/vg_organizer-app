class CallbacksController < Devise::OmniauthCallbacksController

    def github
        @user = User.from_omniauth(request.env['omniauth.auth'])
        sign_in_and_redirect @user
    end
    #creates user from github, auth hash is what we receive from github.


end