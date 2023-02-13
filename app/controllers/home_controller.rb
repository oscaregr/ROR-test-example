class HomeController < ApplicationController
  def index
    user
  end

  private

    def user
      @user = User.find_by(id: Current.user) if Current.user  
    end
end
