class ReceiptsController < ApplicationController

  #GET receipts/
  #
  def index

    @r = Receipt.all()

    respond_to do |format|
      format.json { render json: @r.to_json( only: [:id,:created_at], methods: [:total,:receipt_day])}
      format.html
    end

  end

  #GET receipts/:id
  #
  def show
    @r = Receipt.find(params[:id])
    respond_to do |format|
      format.json { render json: @r.to_json(
        only: [ :id] ,
        methods: [ :total ] ,
        :include => [
          :items => { only: [:id,:name,:category,:price] }
        ]
      ) }
      format.html
    end
  end

  #POST receipts
  #
  def create
    new_receipt = Receipt.new(store_id: params[:store_id])
    new_receipt.save!
    respond_to do |format|
      format.json {render json: new_receipt.to_json( only: [:id])}
      format.html
    end
  end

  #PATCH receipts/:id
  #
  def update

    item = Item.find(params[:item_id])

    entry = ReceiptEntry.where(
            item_id: params[:item_id],
            receipt_id: params[:id]
        ).first_or_create

    render json: Receipt.find(params[:id])

  end

  #GET receipts/last
  #
  def lastReceipt

    render json: Receipt.last.id

  end
end
