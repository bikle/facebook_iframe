# I built this class after studying this file:
# vendor/plugins/facebooker/lib/facebooker/rails/publisher.rb
# This class is similar to ActionMailer.
# We can use it to both create and deliver messages.
# We create messages when we want to just look at them or test their creation.
# We deliver messages when we are confident that creation works okay.
class FbPublisher < Facebooker::Rails::Publisher

  # Templates.
  # The naming convention for templates is the name of the action followed by an _template.
  def publish_nf_template
    one_line_story_template "{*actor*} Published a message to News Feed via Facebooker::Rails::Publisher"
  end #def publish_nf_template

  # Actions which publish messages.
  # Demo:
  # create_publish_nf(fbusr1, fbusr1, {:message => "hello world"})
  def publish_nf(user_with_session_to_use, user_to_update, params)
    send_as :publish_stream
    from  user_with_session_to_use
    target user_to_update
    # attachment params[:attachment]
    message params[:message]
    # action_links params[:action_links]
  end # def publish_nf()

end # class
