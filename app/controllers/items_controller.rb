class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:update,:destroy,:move_to_index]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show,:new,:create]

   def index
     @items = Item.order("created_at DESC")
     @order = Order.order("created_at DESC")
   end

   def new
      @item = Item.new
    end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :"items/edit"
    end
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end




  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :state_id, :payer_id, :prefecture_id,
                                 :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
  if @item.order.present?
    redirect_to action: :index
      elsif not user_signed_in?
        redirect_to action: :index
          elsif current_user.id != @item.user_id 
            redirect_to action: :index
          end
      end
      

end
