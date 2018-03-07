class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
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
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  
end
