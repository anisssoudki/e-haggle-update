class CommentsController < ApplicationController
before_action :set_product
before_action :require_user

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to user_product_path(current_user, @product)
  end

private 

def comment_params
  params.require(:comment).permit(:body, :product_id)
end 

def set_product
  @product = Product.find(params[:product_id])
end
end
