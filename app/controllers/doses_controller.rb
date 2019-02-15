class DosesController < ApplicationController

  # def new
  #   # params with id of cocktail goes from url params
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  # ADD FORM TO SHOW PAGE -> def new removed, routes - changed, render...
  def create
    # after submit the form => id of cocktail in params
    @cocktail = Cocktail.find(params[:cocktail_id])
    # raise
    # secure params
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      # redirect_to cocktail_path(@cocktail)
      redirect_to cocktail_path(@cocktail)
    else
      # render "doses/new" CHANGE PATH TO FORM
      render "cocktails/show"
      # new_cocktail_dose GET  /cocktails/:cocktail_id/doses/new   doses#new
    end
  end

  def destroy
    # find by cocktail
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

# 1. Dose is associated with Cocktail
# => dose = Dose.new(description: ...., ingredient_id: 20), dose.cocktail = Some cocktail
# 2. destroy -> a. find cocktail by id @cocktail = @dose.cocktail or above

# "dose"=>{"description"=>"The best", "ingredient_id"=>"5"},
# "commit"=>"Create Dose", "controller"=>"doses", "action"=>"create",
# "cocktail_id"=>"2"} permitted: false>
