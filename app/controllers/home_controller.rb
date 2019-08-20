class HomeController < ApplicationController
  
  before_action :authenticate, except: :index

  def index
  end
  
  def show
  end
end
