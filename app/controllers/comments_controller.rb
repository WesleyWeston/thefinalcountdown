class CommentsController < ApplicationController
  def new
  end

  def create
  @comment = Comment.new(comment_params)
    
    @comment.user_id = current_user.id
   
   
    
    if @comment.save 

      redirect_to post_path(@comment.post_id)
    else
      redirect_to "/error"
    end
  end


  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @comments = Comment.all
  end

  def show
  end

  private 
  def comment_params

  params.require(:comment).permit(
    :post_id,
    :comment_content
    )
  end
end
