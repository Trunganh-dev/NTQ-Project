class UsersController < ApplicationController
    def index
        @group = Group.where(course_id: params[:course_id]) 
    end
    def show
        @user = User.find(params[:id])
    end
end
