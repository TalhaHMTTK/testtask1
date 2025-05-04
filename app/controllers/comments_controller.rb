class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post, notice: "Comment created." }
      end
    else
      render partial: "comments/form", locals: { comment: @comment, post: @post }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
