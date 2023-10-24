class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    comment = @tweet.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
    redirect_back(fallback_location: root_path)
    else
      render "tweets/show"
    end
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @tweet
    else
      flash[:danger] = "Comment failed"
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :text, :video).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
