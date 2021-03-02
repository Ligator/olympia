class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build(comment_params.merge(user: current_user))
    @store = @product.store
    if @comment.save
      flash[:notice] = I18n.t(:comment_was_created)
    else
      flash[:alert] = I18n.t(:comment_was_not_created)
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to store_product_path(@product.store, @product)
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
