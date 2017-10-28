class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index,:show,]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, admin: :all

  # looking for a true or false or 1 value
  ##  scope :category, -> { where(category: true) }


  def index
      # @products = Product.all
      @filterrific = initialize_filterrific(
        Product,
        params[:filterrific]
      ) or return
      @products = @filterrific.find.page(params[:page]).order("created_at DESC").per(10)
      # @products = @filterrific.find.page(params[:page]).per(10)

      respond_to do |format|
        format.html
        format.js
      end

      rescue ActiveRecord::RecordNotFound => e
        # There is an issue with the persisted param_set. Reset it.
        puts "Had to reset filterrific params: #{ e.message }"
        redirect_to(reset_filterrific_url(format: :html)) and return
# search
      #  if params[:search]
      #    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page])
      #  else
      #    @products = Product.page(params[:page]).per(10)
      #  end

  end

  def show
    if @product.reviews.blank?
      @average_review = 0
    else
      @average_review = @product.reviews.average(:rating).round(1)
    end

    # creating the variable in order to make cart_item.quantity form
    @cart_item = CartItem.new(:product_id => @product.id)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 #
 # def add_to_cart
 #     if session[:cart_id].blank?
 #       cart = Cart.create(status:"pending")
 #       session[:cart_id] = cart.id
 #     else
 #       cart = Cart.find(session[:cart_id])
 #     end
 #
 #     product = Product.find(params[:id])
 #     cart.cart_items.create(product_id: product.id)
 #     redirect_to cart
 #
 # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:photo, :description, :price,:photo, :photo_cache, :category_id)
    end

end
