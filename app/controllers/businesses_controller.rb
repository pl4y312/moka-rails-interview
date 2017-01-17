class BusinessesController < ApplicationController

  # Create new business page
  # GET /businesses/new
  def new
    # User unallowed create new business if already have one
    if current_business.present?
      redirect_to items_path, alert: "Your business already created."
    else
      @business = Business.new
    end
  end

  # Create new business
  # POST /businesses
  def create
    @business = Business.new(business_params)
    if @business.save
        redirect_to items_path, notice: "The business successfully created. You can add item now."
      else
        render 'new'
      end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :city).merge(user_id: current_user.id)
  end

end
