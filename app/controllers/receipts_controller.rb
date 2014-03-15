class ReceiptsController < ApplicationController

  #GET receipts/
  #
  def index

    @r = User.find(params[:user_id]).receipts

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

  #POST addItem
  #
  def addItem

    name = params[:name]
    table_id = params[:table]
    item = Item.where(name: name).first_or_create
    table = Table.find(table_id)

    if ( table.last_receipt.nil? )
      table.receipts << Receipt.new()
      receipt = table.last_receipt
    end

    table.last_receipt.items << item

    render json: { "success" => true }
  end

  #POST deleteItem
  #

  def removeItem

    name = params[:name]
    table = params[:table]
    item = Item.where(name: name).first_or_create
    receipt = Table.find( table ).last_receipt
    #receipt.items.destroy(item)

    receipt.items.each do |current_item|
      if ( current_item.id == item.id )
        r = ReceiptEntry.where(item_id: current_item.id, receipt_id: receipt.id).first.destroy
        render json: { "success" => true }
        return
      end
    end

    render json: { "success" => false }

  end

end
