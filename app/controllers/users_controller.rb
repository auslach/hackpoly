class UsersController < ApplicationController
  before_action :authenticate_user!

  def application
    @user = current_user
  end

  def profile
    @user_info = current_user.user_info
  end

  def update
    if current_user.user_info.update(user_info_params)
      flash[:success] = "Your profile has been updated!"
      redirect_to update_user_profile_path
    end
  end

private

def user_info_params
  params.require(:user_info).permit(:first_name, :last_name, :major, :year_in_school, :skillset, :website_url, :github_url, :linkedin_url, :coolest_built)
end

end
