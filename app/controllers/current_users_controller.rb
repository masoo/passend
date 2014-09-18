class CurrentUsersController < Devise::RegistrationsController
  layout 'top', except: :edit
end
