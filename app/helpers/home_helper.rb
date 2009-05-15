module HomeHelper
  def redirect_url_or_default
    if session[:redirect_url]
      session[:redirect_url]
    else
      "/"
    end
  end
end
