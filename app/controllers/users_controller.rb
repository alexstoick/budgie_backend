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

  def add_wishlist

    item_id = params[:item_id]
    user_id = params[:id]

    wishlist_entry = Wishlist_entry.where(
      item_id: item_id ,
      user_id: user_id
      ).first_or_create

    render json: wishlist_entry
  end
end
