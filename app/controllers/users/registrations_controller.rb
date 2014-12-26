class Users::RegistrationsController < Devise::RegistrationsController

protected

def after_update_path_for(resource)
  user_application_path
end

end
