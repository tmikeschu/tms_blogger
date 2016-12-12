class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash.notice = "#{@article.title} was created!"
    redirect_to article_path(@article)
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article_id
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "#{@article.title} was updated!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "#{@article.title} was destroyed!"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :tag_list)
    end
    
end
