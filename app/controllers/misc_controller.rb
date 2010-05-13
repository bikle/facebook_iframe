class MiscController < ApplicationController

  def index
  end

  def jq_scrape_form
  end 

  def jq_scrape
    require 'open-uri'
    @myurl= params[:myurl]
    hdrs= {"User-Agent"=>"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.1.1) Gecko/20061204 Firefox/2.0.0.1", "Accept-Charset"=>"utf-8", "Accept"=>"text/html"}
    my_html= ""
    open(@myurl, hdrs).each {|s| my_html << s}
    # This works on the whiteboard but not here:
    # @my_html= my_html.sub(/.+<body/,'<body').sub(/<\/body>.+$/,'</body>')
    # Dont worry, jQuery will eventually toss everything in the trash.
    @my_html= my_html
  end # def jq_scrape

  def jquery_accordion
  end 

end # class MiscController

