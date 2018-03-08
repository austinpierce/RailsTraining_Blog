class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "abc", password: "1234", except:
 [:index, :show]
  
  def index
    @articles = Article.all
  end
  
  def new
   @article = Article.new
   # The reason why we added 
   # @article = Article.new in the 
   # ArticlesController is that otherwise 
   # @article would be nil in our view, 
   # and calling @article.errors.any? 
   # would throw an error
  end
  
  def create
    @article = Article.new(article_params) 
    # Article is referring to the class in models/article.rb
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id]) # @article is an instance variable
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
    
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  
end
