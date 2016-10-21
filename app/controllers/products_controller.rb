class ProductsController < ApplicationController
  before_action :load_product, only: [:show, :edit]

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

  def show
    @categories = Category.all
    @comment = Comment.new product: @product
    @comments = @product.comments.newest.page(params[:page])
      .paginate page: params[:page], per_page: Settings.comment.per_page
  end

end
