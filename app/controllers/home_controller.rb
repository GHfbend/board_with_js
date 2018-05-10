class HomeController < ApplicationController
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @post = Post.new
    @post.content = params[:post][:content]
    
    if @post.save
      respond_to do |format|
        format.js
      end
    end
    
    #redirect_to '/home/index'
  end

  def destroy
    @post = Post.find(params[:post_id])
    
    if @post.destroy
      respond_to do |format|
        format.js
      end
    end
    
    #redirect_to '/home/index'
  end
end
