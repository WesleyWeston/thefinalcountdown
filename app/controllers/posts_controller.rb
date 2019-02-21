class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.image.url == nil
      
      redirect_to posts_new_path, notice: "You must select a photo!"

    else
      if @post.save
      redirect_to posts_path
      else
      redirect_to "error"
      end
  end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    # byebug
    if params[:user_id]
      @posts = Post.search_post(params[:user_id])
      @posts = @posts.paginate(:page => params[:page], :per_page => 24)
      # @posts = @posts.all.user_id(params[:user_id]) if params[:user_id].present?
    else
      @posts = Post.all.paginate(:page => params[:page], :per_page => 24)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.all.where("post_id = #{params[:id]}")
   
  end


private
def post_params
  params.require(:post).permit(
    :description,
    :image,
    :user_id
    )
end

end
