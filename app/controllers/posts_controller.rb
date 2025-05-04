class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit_title, :update_title]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    render layout: false if turbo_frame_request?
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Quote was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit_title
    render partial: "edit_title", locals: { post: @post }
  end

  def update_title
    if @post.update(post_params)
      render partial: "title", locals: { post: @post }
    else
      render partial: "edit_title", locals: { post: @post }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title)
  end
end
