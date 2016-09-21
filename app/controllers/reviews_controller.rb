class ReviewsController < ApplicationController
  before_action :set_recipe
  
  def create
    unless current_user
      flash[:danger] = "Please register or sign in to post reviews."
      redirect_to "/register.html"
    else
      @review = @recipe.reviews.build(review_params)
      @review.chef = current_user  
      
      if @review.save
        flash[:success] = "Your review was added succesfully!"
      else
        flash[:danger] = "Review was not added, please try again."
      end
      
      redirect_to recipe_path(@recipe)
    end
  end
  

  private
  
    def review_params
      params.require(:review).permit(:body)
    end
  
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
  
end