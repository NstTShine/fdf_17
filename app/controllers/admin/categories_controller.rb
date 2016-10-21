class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.page params[:page]
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "update successfully"
      redirect_to admin_categories_path
    else
      flash[:success] = "update fail !"
      render :edit
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "create successfully"
      redirect_to admin_categories_path
    else
      flash[:danger] = "create failed!"
      render :new
    end
  end

  def destroy
    if @category.products.any?
      flash[:danger] = "you must delete products first!"
    elsif @category.destroy
      flash[:success] = "delete successfully!"
    else
      flash[:success] = "update fail !"
    end
    redirect_to :back
  end

  private
  def category_params
    params.require(:category).permit :title_name, :description, :image
  end
end
