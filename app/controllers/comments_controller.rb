class CommentsController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to blog_path(@comment.blog) }
        format.js
      end
    else
      redirect_to :new
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to blog_path(@comment.blog)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@comment.blog)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :blog_id)
  end
end
