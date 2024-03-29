module Auth0Helper
  private

  # Is the user signed in?
  # @return [Boolean]
  def user_signed_in?
    session[:userinfo].present?
  end

  # Set the @current_user or redirect to public page
  def authenticate_user!
    # Redirect to page that has the login here
    if user_signed_in?
      @current_user = User.find_or_create_by(
        auth0_id: session[:userinfo].uid
      )
    else
      redirect_to root_path
    end
  end

  # What's the current_user?
  # Return [Hash]
  def current_user
    @current_user
  end
end
