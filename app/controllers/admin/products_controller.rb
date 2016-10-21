class Admin::ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :load_product, except: [:show, :new, :create, :index]

  def index
    if params[:category_id_eq].present?
      param = Hash.new
      param[:category_id_eq] = params[:category_id_eq]
      @q = Product.ransack param
    else
      @q = Product.ransack params[:q]
    end
    @products = (@q.result.order created_at: :desc).page(params[:page])
      .paginate page: params[:page], per_page: Settings.product.per_page
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "admin_control.product.update_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t "admin_control.product.update_fail"
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "delete successfully!"
    else
      flash[:success] = "update fail !"
    end
    redirect_to :back
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "create successfully"
      redirect_to admin_products_path
    else
      flash[:danger] = "create failed!"
      render :new
    end
  end


  private
  def product_params
    params.require(:product).permit :name, :price, :image, :description,
      :quantity, :category_id
  end
end
