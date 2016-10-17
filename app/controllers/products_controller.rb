class ProductsController < ApplicationController

 def index
    @q = Product.ransack params[:q]
    @products = (@q.result.order created_at: :desc).page(params[:page])
      .paginate page: params[:page], per_page: Settings.product.per_page
    @categories = Category.all
  end
end
