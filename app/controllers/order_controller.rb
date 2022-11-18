class OrderController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_item, only: [:index,:create,:move_to_index]
  before_action :move_to_index, only: [:index]

  def index
    @order_destination = OrderDestination.new

  end
  
  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],   
        currency: 'jpy'                 
      )
      @order_destination.save
      redirect_to root_path
    else
      render :'index'
    end

  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def move_to_index
    if @item.order.present?
      redirect_to root_path
    elsif not user_signed_in?
      redirect_to root_path
    elsif current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
 


end
