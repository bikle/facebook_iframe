class FqlController < ApplicationController
  def index
  end

  # Sends a simple query to the FQL table named "user".
  # Note that it is difficult to search an FQL table like you can a normal database table.
  # You usually need to know what the value of the primary key is.
  # For example, you cannot issue a query like this:
  # SELECT name FROM user WHERE name > "Bob Smith"
  def uuser
    # We can easily get the p-key of user of the session. So, that makes a nice demo:
    @fql_query= "SELECT name, pic_square, profile_url, username, website, is_blocked, email FROM user WHERE uid = #{@facebook_session.user.uid}"
    # fql_query() returns an array.  
    # In this example the array contains only 1 element and we use .first() to get it.
    @qry_output= @facebook_session.fql_query(@fql_query).first
  end

end
