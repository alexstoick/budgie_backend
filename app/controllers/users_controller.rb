class UsersController < ApplicationController
  def show

    u = User.includes(:devices,:wished_items).find(params[:id])
    render json: u.to_json(
      methods: [:full_name] ,
      :include => {
        :devices => { only: [:device_token] },
        :wished_items => { only: [:id, :name] }
      }
    )
  end

  def wishlist
    u = User.includes(:wished_items).find(params[:user_id])
    render json: u.to_json(
      only: [],
      :include => {
        :wished_items => { only: [:id, :name, :category] }
      }
    )
  end

  def add_wish

    item_id = params[:item_id]
    user_id = params[:user_id]

    entry = WishlistEntry.where(
      item_id: item_id ,
      user_id: user_id
    ).first_or_create

    render json: entry
  end

  def remove_wish
    item_id = params[:item_id]
    user_id = params[:user_id]

    entry = WishlistEntry.where(
      item_id: item_id ,
      user_id: user_id
    ).first
    entry.destroy

    render json: entry
  end
end
