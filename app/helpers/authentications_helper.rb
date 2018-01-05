module AuthenticationsHelper
  def has_warning_flash_notice
    flash[:notice].present? ? " has-warning" : ""
  end
end
