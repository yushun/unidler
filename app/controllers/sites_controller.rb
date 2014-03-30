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
    site = Site.new(site_params)
    if site.save
      flash[:notice] = "#{site.address} successfully added."
    else
      error = site.errors.full_messages.first || "#{site.address} cannot be added, please check the url again."
      flash[:error] = error
    end
    redirect_to root_path
  end

  def edit 
    @site = Site.find params[:id]
  end

  def update
    site = Site.find params[:id]
    site.update!(site_params)
    redirect_to root_path
  end

  private

  def site_params
    params.require(:site).permit(:name, :address)
  end
end
