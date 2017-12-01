class ArticlesController < ApplicationController
    # Aesta ruta se accede con el verbo >GET /articles y el pack articles
    before_action :authenticate_user!, except: [:show,:index]
    before_action :set_article, except: [:index,:new,:create]
    before_action :authenticate_editor!, only: [:new,:create,:update]
    before_action :authenticate_admin!, only: [:destroy]
    def index
        # Va devolver todos los registros
        @articles = Article.all

        
    end
    #GET/articles/:id
    def show
        # Show va a encontrar un registro por su id

    end
    def new
        @article = Article.new
        
    end
    def edit

    end
    #POST /articlesse accede por ,edio dde un post
    def create
        @article = current_user.articles.new(article_params)

        @article.ganancia= (@article.precio - @article.costo)/@article.costo





        if @article.save
        redirect_to @article 
        else 
            render :new
        end
    end
    def destroy
        
        @article.destroy
        redirect_to articles_path
        # Cambio
    end
    def update
        
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end 

    end
    private
    def set_article
        @article = Article.find(params[:id])
    end
    #def validate_user
        #redirect_to new_user_session_path, notice:"Sorry,I need Login in"
    #end
    def article_params
        params.require(:article).permit(:nombre,:descripcion,:precio,:costo)
    end
    
end