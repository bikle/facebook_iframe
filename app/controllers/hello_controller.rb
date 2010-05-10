class HelloController < ApplicationController
  def index
    # Simple logic to set a variable which is later read by application.haml which then swaps in some JavaScript to control iframe scrollbars.
    case
    when params[:scrollbar]== "on"
      @scrollbar= session[:scrollbar]= true
    when params[:scrollbar]== "off"
      @scrollbar= session[:scrollbar]= false
    else
    end # case
  end # def index

  def world
  end

  def permissions
  end

end
