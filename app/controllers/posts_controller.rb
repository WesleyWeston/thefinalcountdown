class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
    else
      redirect_to "error"
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @post = Post.find(params[:id])
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
