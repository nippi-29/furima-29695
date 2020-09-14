class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.all.order('created_at DESC')
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

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else render :show
    end
  end

  def edit
  end

  def update
    @item.update(product_params)
    if @item.save
      redirect_to root_path
    else render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :item_status_id, :postage_id, :region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @item = Product.find(params[:id])
  end
end
