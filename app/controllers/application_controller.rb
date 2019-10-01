class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  before_action :course

  def course
    @course = Course.all.page(params[:page]).per(6)
    @cour   = Course.all.order(name: :desc)
  end
end
