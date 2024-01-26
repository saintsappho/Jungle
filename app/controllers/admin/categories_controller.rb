class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  #def destroy
  #  @category = Category.find(params[:id])
  #  @category.destroy
  #  redirect_to admin_categories_path, notice: 'Category was successfully deleted.'
  #end
  def new
    @category = Category.new
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category was successfully saved.'
    else
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end
end