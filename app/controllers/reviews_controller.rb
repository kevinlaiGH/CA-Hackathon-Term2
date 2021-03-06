class ReviewsController < ApplicationController

  before_action :find_product
  before_action :find_review,  only:[:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if review.updated(review_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_review
      @review = Review.find(params[:id])
  end

end
