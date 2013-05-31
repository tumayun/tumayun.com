module ApplicationHelper

  # new_user_session_page?
  # create_user_session_page?
  # new_user_registration_page?
  # create_user_registration_page
  # new_user_confirmation_page?
  # create_user_confirmation_page?
  # new_user_password_page?
  # create_user_password_page?
  %w(sessions registrations confirmations passwords).each do |_controller|
    %w(new create).each do |_action|
      define_method "#{_action}_user_#{_controller.singularize}_page?" do
        params[:controller] == "devise/#{_controller}" && action_name == _action
      end
    end
  end
end
