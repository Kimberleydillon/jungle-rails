class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id

    if @review.save!
      redirect_to @product
    else
      redirect_to @product
    end
  end
  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), notice: "Review Destroyed!"
  end


 private
  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
