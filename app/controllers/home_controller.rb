class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        #render pdf: 'zalupa'
      end
    end
  end
end
