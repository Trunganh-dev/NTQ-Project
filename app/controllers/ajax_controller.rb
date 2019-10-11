class AjaxController < ApplicationController
  def getemail
    # binding.pry
    @pa = params[:email][:email]
    @email = User.where("name LIKE ?", "#{params[:email]}%")
  end
end
