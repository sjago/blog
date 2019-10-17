class CategoriesController < ApplicationController

  def index

    @categories = Category.all

  end

  def new

    @category = Category.new

  end

  def create

    attrs = params.require(:category).permit(:name)
    @category = Category.new(attrs)

    if @category.save
      redirect_to categories_path   
    else
      render :new
    end

  end

  def show

    @category = Category.find(params[:id])

  end

  def edit

    @category = Category.find(params[:id])

  end

  def update

    @category = Category.find(params[:id])
    attrs = params.require(:category).permit(:name)
    @category.update(attrs)

    redirect_to categories_path
  end


end