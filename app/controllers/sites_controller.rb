class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
    @site = Site.find params[:id]
  end

  def new
    @site = Site.new
  end

  def create
    site = Site.create!(site_params)
    redirect_to sites_path, notice: "#{site.address} successfully added."
  end

  def edit 
    @site = Site.find params[:id]
  end

  def update
    site = Site.find params[:id]
    site.update!(site_params)
    redirect_to site
  end

  private

  def site_params
    params.require(:site).permit(:name, :address)
  end
end
