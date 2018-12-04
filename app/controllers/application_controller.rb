class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_p3p_header

  def set_p3p_header
    headers['P3P'] = 'CP="ALL DSP COR CURa ADMa DEVa OUR IND COM NAV"'
  end
end
