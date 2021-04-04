class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[ show edit update destroy ]


  def index
    @articles = Post.select(:category_id).distinct

    @posts = Post.all

      @q = Post.where(status: 'true').ransack(params[:q])

    cate = params[:cate]

    if !cate.nil?
      @posts = Post.where( status: 'true', :category_id => cate)
    else

      @posts = @q.result(distinct: true)

    end

  end

  # GET /posts/1 or /posts/1.json
  def show
    @posts = Post.all

    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @categories = Category.all

  end

  # GET /posts/1/edit
  def edit
    @categories = Category.all

  end

  # POST /posts or /posts.json
  def create

    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :image, :user_id, :category_id)
  end
end
