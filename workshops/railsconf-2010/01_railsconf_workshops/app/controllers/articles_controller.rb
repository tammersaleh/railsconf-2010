class ArticlesController < ApplicationController
  # GET /articles
  def index
    conditions = {}
    conditions[:category_id] = params[:category] if params[:category].present?
    conditions[:state_id] = params[:state] if params[:state].present?

    @articles = Article.all(:conditions => conditions)
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(params[:article])

    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to articles_path
    else
      render :action => "new"
    end
  end

  # PUT /articles/1
  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      flash[:notice] = 'Article was successfully updated.'
      redirect_to articles_path
    else
      render :action => "edit"
    end
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to(articles_url)
  end

  # POST /articles/1/flag
  def flag
    article = Article.find(params[:id])
    article.flag!
    flash[:success] = "Article was successfully flagged"
    redirect_to article_path(article)
  end
end
