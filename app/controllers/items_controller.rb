class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    if user_signed_in?
      @items = Item.where(:user_id => current_user.id).order('created_at DESC')
      @items = Item.paginate(page: params[:page], per_page: 2)
    end
  end

  def new
*    @item = current_user.items.build
  end

  def show
  end
  def create
    @item = current_user.items.build(items_params)
    if @item.save
      flash[:notice] = "The Item was created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed, Time.now)
    redirect_to root_path
  end


  def items_params
      params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
