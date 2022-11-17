class OrderController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new

  end
  
  def create
    @item = Item.find(params[:item_id])
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

 

end
