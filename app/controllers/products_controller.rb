class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :item_status_id, :postage_id, :region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
