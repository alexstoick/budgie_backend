class ReceiptsController < ApplicationController

  #GET receipts/:id
  #
  def show
    render json:Receipt.find(params[:id])
  end

  #POST receipts
  #
  def create
    new_receipt = Receipt.new(store_id: params[:store_id])
    new_receipt.save!
    render json: new_receipt
  end

  #PATCH receipts/:id
  #
  def update

  end
end
