class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
 
  def index
    if @item.user == current_user.id || @item.purchase.present?
      redirect_to root_path
    else
      @purchase_form = PurchaseForm.new
    end
  end

  def create
    binding.pry
    @purchase_form = PurchaseForm.new(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :province_id, :city, :address_line1, :building, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
