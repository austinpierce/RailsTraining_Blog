class ArticlesController < ApplicationController
  
  def new
  end
  
  def create
    @article = Article.new(article_params) 
    # Article is referring to the class in models/article.rb
    @article.save
    redirect_to @article
  end
  
  def show
    @article = Article.find(params[:id]) # @article is an instance variable
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  
end
