module Auth0Helper
  private

  def logged_in_using_omniauth?
    # Redirect to page that has the login here
    if session[:userinfo].present?
      @user = session[:userinfo]
    else
      redirect_to root_path
    end
  end
end
