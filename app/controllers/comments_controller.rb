class CommentsController < ApplicationController
  before_action :set_blog_from_domain

  # GET /article/:article_id/comments
  def index
    @article = Article.find params[:article_id]
    redirect_to @article
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
    redirect_to @comment.article
  end

  # POST /article/:article_id/comments
  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render @article }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :content)
    end
end
