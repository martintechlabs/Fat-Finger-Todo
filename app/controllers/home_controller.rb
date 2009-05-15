class HomeController < ApplicationController
  before_filter :set_facebook_session
  helper_method :facebook_session
end
