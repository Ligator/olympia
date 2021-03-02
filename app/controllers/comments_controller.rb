class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build(comment_params.merge(user: current_user))
    @store = @product.store
    @comment.save
    @flag_message = true
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @store = @product.store
    @comment.destroy
    @message = "your comment has been deleted"
    @flag_message = true
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    @product = @comment.product
    @store = @product.store
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update(comment_params)
    @product = @comment.product
    @store = @product.store
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
