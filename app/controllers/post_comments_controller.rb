class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.post_comments.new(post_comment_params)
    # @comment = current_comments.new(book_id: @book.id)
    @comment.book_id = @book.id
    @comment.save
    render :post_comments
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    # @comment.destroy
    @book = Book.find(params[:book_id])
    # # book = Book.find(params[:id])
    # post_comment.book_id = book.id
    # if post_comment.user_id = current_user.id
    # redirect_back(fallback_location: root_path)
    render :post_comments
  end

  private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
