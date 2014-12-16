class UsersController < ApplicationController
  before_action :authenticate_user!

  def application
    @user = current_user
  end

  def profile
    @user = current_user
    @user_info = @user.user_info
    @majors = Major.pluck(:name)
  end

  def update
    if current_user.user_info.update(user_info_params)
      flash[:success] = "Your profile has been updated!"
      redirect_to update_user_profile_path
    end
  end

private

def user_info_params
  params.require(:user_info).permit(:first_name, :last_name, :major, :year_in_school, :skillset, :website_url, :github_url, :linkedin_url, :previous_hackathons, :coolest_built)
end

end
