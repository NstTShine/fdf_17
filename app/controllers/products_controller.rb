class ProductsController < ApplicationController
  before_action :load_product, only: [:show, :edit]

 def index
    @q = Product.ransack params[:q]
    @products = (@q.result.order created_at: :desc).page(params[:page])
      .paginate page: params[:page], per_page: Settings.product.per_page
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @comment = Comment.new product: @product
    @comments = @product.comments.newest.page(params[:page])
      .paginate page: params[:page], per_page: Settings.comment.per_page
  end

end
