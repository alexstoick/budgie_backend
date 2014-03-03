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

    if ( receipt.nil? )
      render json: []
      return
    end

    hash = Hash.new
    receipt.items.each do |item|
      if hash.has_key?(item.name)
        current_hash = hash[item.name] ;
        current_hash[:count] =  current_hash[:count] + 1
      else
        hash[item.name] = { name: item.name , category: item.category , count: 1 , price: item.price }
      end
    end

    array = []

    hash.each do |k,v|
      array << v
    end

    render json: {"items" => array }

  end
end
