class PostsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "1q2",
    except: [:index, :show]  


    def index
       @post_list = Post.all
    end
    def new
        @post = Post.new 
    end
    def show
        @post = Post.find(params[:id])
    end
    def update
        @post = Post.find(params[:id])#находим в бд наш пост по id

        if(@post.update(post_params))#проверка на валидность
            redirect_to @post#перенаправление на сам пост
        else
            render 'edit'#перенаправление на страницу редактирования поста
        end
    end
    def destroy
        @post = Post.find(params[:id])#параметр id 
        
        @post.destroy
        
        redirect_to posts_path
    end
    def edit#перенаправление на страниу редактирования
        @post = Post.find(params[:id])
    end
    def create
        #render plain: params[:post].inspect
        @post = Post.new(post_params)#создали модель
        if(@post.save)#сохранение модель
            redirect_to @post#перенаправление на пост
        else
            render 'new'#перенаправление на страницу создания поста
        end
    end

    private def post_params
        params.require(:post).permit(:title,:content,:post_date)#говорим какие поля разрешены
    end
end
