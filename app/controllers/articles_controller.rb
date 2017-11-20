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
    def edit
        @article = Article.find(params[:id])
    end
    #POST /articlesse accede por ,edio dde un post
    def create
        @article =Article.new(article_params)

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
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end 

    end
    private
    def article_params
        params.require(:article).permit(:nombre,:precio)
    end
    
end