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

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :text, :video).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
