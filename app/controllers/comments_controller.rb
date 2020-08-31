class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret",
                               except: [:create]
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to articles_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @article
  end

  private

  def comment_params
    params.require(:comment).permit(:commentor, :body)
  end
end
