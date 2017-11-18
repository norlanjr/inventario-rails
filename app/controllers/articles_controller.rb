class ArticlesController < ApplicationController
    # Aesta ruta se accede con el verbo >GET /articles y el pack articles
    def index
        # Va devolver todos los registros
        @articles = Article.all
        
    end
    #GET/articles/:id
    def show
        # Show va a encontrar un registro por su id
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
        
    end
    #POST /articlesse accede por ,edio dde un post
    def create
        @article =Article.new({nombre: params[:article][:nombre], precio: params[:article][:precio]})

        if @article.save
        redirect_to @article 
        else 
            render :new
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
        # Cambio
    end
    
end