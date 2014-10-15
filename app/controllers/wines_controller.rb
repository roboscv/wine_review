 class WinesController < ApplicationController
  def index
  	@wines = Wine.all
  end

  def show
	@wine = Wine.find(params[:id])
  end

  def new
  	@wine = Wine.new
  end

  def create
  	@wine = Wine.new(wine_params)
  @wine.save
  redirect_to @wine
  end

  def edit
  	@wine = Wine.find(params[:id])

  end

  def update
  	@wine = Wine.find(params[:id])
  @wine.update(wine_params)
  redirect_to @wine
  end

  def destroy
  	@wine = Wine.find(params[:id])
  	@wine.destroy
  	redirect_to wines_url
	end

  private

  def wine_params
  params.require(:wine).permit(:name, :year, :winery, 
  	:country, :varietal)
  end
end