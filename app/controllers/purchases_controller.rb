class PurchasesController < ApplicationController
 
  def index
    @purchase_form = PurchaseFrom.new
    if @item.purchase.present? || @item.user == current_user
      redirect_to root_path
    end 
  end

  def create
  end

end
