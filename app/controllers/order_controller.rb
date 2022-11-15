class OrderController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :root
    end

  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :adress, :building_name, :phone_number,:price).merge(user_id: current_user.id)
  end

  # 上記のストロングパラメタをまとめたストロングパラメタを作り直す
  # 初めのcreateアクションがsaveメソッドに移動している
  # savesメソッドを使用して保存処理をしたいに目標が変わった
  # ＠item.saveのような記述が必要になっていく
  # ストロングパラメタは、パラむずからの情報取得
  # saveメソッドではどのカラムに何を保存するか指定する
  # ここで使用されているsaveメソッドはモデルもどきで定義したものであり、今までのsaveメソッドとは異なる



end
