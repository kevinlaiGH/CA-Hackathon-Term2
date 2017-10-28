class CartItemsController < ApplicationController

  before_action :set_up

  def create
    # @product = Product.find(params[:product_id])
    @cart_item = CartItem.new(item_params)
    @cart_item.update(cart_id: @cart.id)
    @cart_item.save

    # @cart_item = @cart.cart_items.create(product_id: @product.id)

    respond_to do |format|
        if @cart_item.save
          format.html { redirect_to @cart, notice: 'Product was successfully created.' }
        else
          format.html { redirect_to @product , notice: 'ERROR' }
        end
    end
  end

# http://localhost:3000/carts/1
  def destroy
    @cart_item  = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to  @cart, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_up
    @cart = Cart.find(session[:cart_id])
  end

  def item_params
    params.require(:cart_item).permit(:quantity,:product_id,:cart_id)
  end

end
