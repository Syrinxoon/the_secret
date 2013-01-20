class HomeController < ApplicationController
  skip_before_filter :check_authorization, only: :index
  
  def index
  end
  
  def secret
  end
end
