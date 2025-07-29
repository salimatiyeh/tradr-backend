class ListingsController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :update, :destroy]

  def create
    @listing = current_user.listings.build(listing_params)
    authorize @listing

    if @listing.save
      render json: @listing, status: :created
    else
      render json: { errors: @listing.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @listings = policy_scope(Listing)
    render json: @listings
  end

  def show
    render json: @listing
  end

  def update
    authorize @listing
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: { errors: @listing.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @listing
    @listing.destroy
    head :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :image_url)
  end

end
