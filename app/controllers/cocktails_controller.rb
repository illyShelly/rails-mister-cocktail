class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    # ADDED SEARCH INPUT -> in nav, index.html => if searching -> show where name like sql command
    # present?() public An object is present if it’s not blank. @return [true, false]
    if params[:query].present?
      # use instance variable in html
      @query = params[:query]
      # iLike
      # @cocktails = Cocktail.where("lower(name) LIKE '%#{params[:query]}%' ")
      @cocktails = Cocktail.where("name iLike '%#{params[:query]}%' ")
    else
      @cocktails = Cocktail.all
    end
  end

  # changed show controller for adding form for dose into the page
  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    # @review = Review.new
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
