class OrderController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
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

  # 上記のストロングパラメタをまとめたストロングパラメタを作り直す
  # 初めのcreateアクションがsaveメソッドに移動している
  # savesメソッドを使用して保存処理をしたいに目標が変わった
  # ＠item.saveのような記述が必要になっていく
  # ストロングパラメタは、パラむずからの情報取得
  # saveメソッドではどのカラムに何を保存するか指定する
  # ここで使用されているsaveメソッドはモデルもどきで定義したものであり、今までのsaveメソッドとは異なる



end
