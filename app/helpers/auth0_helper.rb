module Auth0Helper
  private

  def logged_in_using_omniauth?
    # Redirect to page that has the login here
    redirect_to '/' unless session[:userinfo].present?
  end
end
