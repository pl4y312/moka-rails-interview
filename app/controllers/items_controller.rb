class ItemsController < ApplicationController

  around_filter :catch_not_found

  # Get all item list
  # GET /items
  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = current_business.items
    else
    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end
  end

  # Create new item page
  # GET /items/new
  def new
    @item = Item.new
  end

  # Edit item page
  # GET /items/:id/edit
  def edit
    @item = Item.find(params[:id])
  end

  # Create new item
  # POST /items
  def create
    Item.create(item_params)

    redirect_to items_path, notice: "The item successfully added."
  end

  # Update item
  # PUT /items/:id
  def update
    Item.find(params[:id]).update(item_params)

    redirect_to items_path, notice: "The item successfully added."
  end

  # Delete item
  # DELETE /items/:id
  def destroy
    Item.find(params[:id]).destroy

    redirect_to items_path, notice: "The item successfully deleted."
  end

  private

  def item_params
    params.require(:item).permit(:name, :price).merge(business_id: current_business.id)
  end

  # Catch if item not found
  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path, :notice => "Item not found."
  end
end
