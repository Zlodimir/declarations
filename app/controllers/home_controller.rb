class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
      end
    end
  end
end
