class PostsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
     @post = Post.new
     @room2 = Room2.find(params[:room2_id])
     @posts = @room2.posts.includes(:user)

     query = "SELECT * FROM rooms"
     @room2s = Room2.find_by_sql(query)
   end
 
   def create
     @room2 = Room2.find(params[:room2_id])
     @post = @room2.posts.new(post_params)
     if @post.save
       redirect_to room2_posts_path(@room2)
     else
       @posts = @room2.posts.includes(:user)
       render :index
     end
   end
 
   private
   def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @post = Post.find(params[:id])
    unless current_user == @post.user
      redirect_to root_path
    end
  end
end
