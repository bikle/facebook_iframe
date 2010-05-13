class FbmlController < ApplicationController
  def index
  end

  def write2news_feed
    # fb:multi-friend-input gives us params["ids"].
    # If params["ids"] is nil, just return.  This just shows the form.
    return if params["ids"].nil?
    # Get my id from facebook_session
    fbuid= facebook_session.user.uid
    fb_sender= Facebooker::User.new(fbuid)
    begin
      # Put myself at the head of the list.
      # fb:multi-friend-input may provide more fb-ids via params["ids"]
      fb_recipients_ids= ([fbuid]+ params["ids"]).flatten.uniq
      # Loop through each id. Be careful, we might have a nil in there (we should not but check anyway).
      fb_recipients_ids.each{ |fbid|
        unless fbid.nil?
          fb_recipient= Facebooker::User.new(fbid)
          FbPublisher.deliver_publish_nf(fb_sender, fb_recipient, {:message => "This is a test of write2news_feed(): #{params['msg4nf']}"})
        end # unless fbid.nil?
      }
    rescue Facebooker::Session::PermissionError
      @facebooker_session_permissionerror= true
    end # begin, rescue
  end # def write2news_feed

end #class
