class TablesController < ApplicationController
  def create

    # Create a new receipt and associate it with this table.
    id = params[:id]
    table = Table.find(id)
    table.receipts << Receipt.new()

    render json: table.to_json( only: [:id, :id_from_restaurant] , methods: [:last_receipt] )

  end
  def show
    table = Table.find(params[:id])

    receipt = table.last_receipt

    render json: receipt.to_json( only:[ :id] ,include: [ :items ])
  end
end
