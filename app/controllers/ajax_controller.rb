class AjaxController < ApplicationController
  def getemail
    @email = User.where("email LIKE ?", "%#{params[:email]}%")
    binding.pry
    return @email
   
  end
end
