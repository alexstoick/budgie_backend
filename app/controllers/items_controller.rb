class ItemsController < ApplicationController

  #GET items/
  #
  def index
    render json: Item.all().to_json( :only => [:id,:name,:price,:category])
  end

  #GET items/:id
  #
  def create
    name = params[:name]
    category = params[:category]
    code = params[:code]
    price = params[:price]

    current_item = Item.where(code: code).first_or_initialize(
      code: code,
      category: category,
      name: name,
      price: price
    )

    current_item.save!

    render json: current_item
  end

end
