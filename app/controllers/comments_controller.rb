class CommentsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "1q2",

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comments_params)
        redirect_to  post_path(@post)
    end
    
    private def comments_params
        params.require(:comment).permit(:user_name, :body)
        
    end
end
