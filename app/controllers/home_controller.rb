class HomeController < ApplicationController
  def show
    redirect_to leads_path if user_signed_in?
  end
end
