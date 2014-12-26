class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:index]

  def application
    @user = current_user
  end

  def profile
    @user = current_user
    @user_info = @user.user_info
    @majors = Major.pluck(:name)
    @universities = University.pluck(:name)
  end

  def update
    @user = current_user
    @user_info = @user.user_info
    @majors = Major.pluck(:name)
    if current_user.user_info.update(user_info_params)
      flash[:success] = "Your profile has been updated!"
      redirect_to update_user_profile_path
    else
      render 'profile'
    end
  end

  def index
    @emails = MAILCHIMP.lists.members(ENV['MAILCHIMP_LIST_ID'])['data']
  end

private

def user_info_params
  params.require(:user_info).permit(:first_name, :last_name, :major, :year_in_school, :skillset, :website_url, :github_url, :linkedin_url, :previous_hackathons, :coolest_built, :university, :age, :gender, :ethnicity)
end

def authorize_admin
  if current_user.admin?
    return
  else
    redirect_to root_url
  end
end

end
