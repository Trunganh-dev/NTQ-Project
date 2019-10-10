class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include UsersHelper
  before_action :course
  before_action :follow_group
  def course
    @course = Course.all.page(params[:page]).per(6)
    @cour   = Course.all.order(name: :desc)
  end

  def follow_group
    @following = current_user.groups.order(name: :asc) if user_signed_in?
  end

end
