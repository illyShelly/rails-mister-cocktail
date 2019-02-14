class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  # form
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      # if saved redirect to
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  def destroy
    @cocktail.destroy
     # redirecting to all cocktails
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    # in params key cocktail is allowed just :name
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
