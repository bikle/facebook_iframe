# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging :fb_sig_friends
  before_filter :ensure_application_is_installed_by_facebook_user
  before_filter :facebook_variables

  # Define some useful variables
  def facebook_variables
    @facebooker_config    = Facebooker::AdapterBase.facebooker_config
    @canvas_page_name     = @facebooker_config['canvas_page_name']
    @application_base_url = 'http://apps.facebook.com/' + @canvas_page_name
    @api_key              = @facebooker_config['api_key']
    @ajax_server          = "#{Facebooker::AdapterBase.facebooker_config['callback_url']}"
  end

end
