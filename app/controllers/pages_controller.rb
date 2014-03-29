class PagesController < ApplicationController
  def index
    @site = Site.new
  end
end
