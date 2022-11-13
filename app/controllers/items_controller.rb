class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show,]

   def index
     @items = Item.order("created_at DESC")
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
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to root_path
    else
      render :"items/edit"
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
    if not user_signed_in?
      redirect_to action: :index
    elsif current_user.id != @item.user_id 
      redirect_to action: :index
    end
  end


end
