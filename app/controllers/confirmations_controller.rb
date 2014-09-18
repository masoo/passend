class ConfirmationsController < Devise::ConfirmationsController
  layout 'top'

  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
  end
end
