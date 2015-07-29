class PostsController < ApplicationController
  def index #show everything
    @posts = Post.all
  end

  def new #psuedo resource to create , point is to just get form.
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update( post_params )
        redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy

     redirect_to posts_path

   end


private

def post_params
  params.require(:post).permit(:title,:tags,:body)
end


end
