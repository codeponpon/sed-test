class ApplicationController < ActionController::Base
  include ActionController::Serialization
  protect_from_forgery :with => :exception

  def set_onsignal_user
    current_user
  end

end
