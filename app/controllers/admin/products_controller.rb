class Admin::ProductsController < ApplicationController
  before_action :load_product, only: [:show, :edit, :update]

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

  private
  def product_params
    params.require(:product).permit :name, :price, :image, :description,
      :quantity, :category_id
  end
end
