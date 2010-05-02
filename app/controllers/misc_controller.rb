class MiscController < ApplicationController
  def write2news_feed
    # I will publish to myself first
    fbuid= facebook_session.user.uid
    fb_sender= Facebooker::User.new(fbuid)
    fb_recipient= Facebooker::User.new(fbuid)
    begin
      FbPublisher.deliver_publish_nf(fb_sender, fb_recipient, {:message => "This is a test of write2news_feed()"})
    rescue Facebooker::Session::PermissionError
      @facebooker_session_permissionerror= true
      flash[:error]= "We have a Facebooker::Session::PermissionError.  We can fix this error by going to this URL: http://apps.facebook.com/#{@canvas_page_name}/hello/permissions"
    end

    # Publish to the others

  end # def write2news_feed

end # class MiscController

