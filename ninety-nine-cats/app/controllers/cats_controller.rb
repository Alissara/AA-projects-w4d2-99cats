class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  def new
    render :new
  end

  def create
    @cat = Cat.new(cat_purrams)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      redirect_to new_cat_url
    end
  end

  private

  def cat_purrams
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end
end
