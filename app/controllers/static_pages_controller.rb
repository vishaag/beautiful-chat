class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      redirect_to_users
    end
  end



end
