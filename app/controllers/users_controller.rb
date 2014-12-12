class UsersController < ApplicationController

  def profile
    @user_info = current_user.user_info
  end

  def update
    @user_info = current_user.user_info.update(user_info_params)
  end

private

def user_info_params
  params.require(:user_info).permit(:first_name, :last_name, :major, :year_in_school)
end

end
