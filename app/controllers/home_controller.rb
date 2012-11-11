class HomeController < ApplicationController
  def index
  end
  
  def feelings
    @feelings = Recipe.feelings
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feelings }
    end
  end
  
  def ocassions 
    @ocassions = Recipe.ocassions
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ocassions }
    end
  end
end
