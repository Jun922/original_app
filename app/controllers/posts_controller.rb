class PostsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
     @post = Post.new
     @room = Room.find(params[:room_id])
     @posts = @room.posts.includes(:user)

     query = "SELECT * FROM rooms"
     @rooms = Room.find_by_sql(query)
   end
 
   def create
     @room = Room.find(params[:room_id])
     @post = @room.posts.new(post_params)
     if @post.save
       redirect_to room_posts_path(@room)
     else
       @posts = @room.posts.includes(:user)
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
