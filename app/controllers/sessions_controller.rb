class SessionsController < ApplicationController

    def destroy
        session.delete("email")
        redirect_to root_path
    end
end
