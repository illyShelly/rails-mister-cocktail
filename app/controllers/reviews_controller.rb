class ReviewsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      # handle other dependent -> in Dose file as well
      @dose = Dose.new
      render 'cocktails/show'
    end
  end

  private

  def review_params
    # in params key review is allowed just :content and rating
    params.require(:review).permit(:content, :rating)
  end
end



# 1. find cocktail id Review has cocktail_id
# 2. create new instance of Review
# 3. assign cocktail object to review -> save
# 3b. @dose for show page handle other...
# 4. if save -> "redirect" display on show.html.erb or keep data in form
# 5. create partial file with form (in new folder) for show to add -> render
# 6. controller cocktail update for show action
