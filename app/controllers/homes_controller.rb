class HomesController < ApplicationController
  def top
    redirect_to user_path(current_user.id) if current_user
  end
end
