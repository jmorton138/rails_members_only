class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
        @user = current_user
    end

    def create
       # @post = Post.new(body: params[:body], user_id: params[:current_user_id])
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render :new
        end

            
    end

    private

    def post_params
        params.require(:post).permit(:body, :user_id)
    end


end
