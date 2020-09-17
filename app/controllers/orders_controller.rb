class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :block_request, only: [:index]
  before_action :authenticate_user!

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_product
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_order
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def block_request
    if @product.order.present?
      redirect_to root_path
    elsif user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    end
  end
end
