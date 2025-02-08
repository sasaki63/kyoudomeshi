class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        tweet = Tweet.find(params[:tweet_id])
        comment = tweet.comments.build(comment_params)
        comment.user_id = current_user.id
      
        # 送信されたパラメータを確認
        Rails.logger.debug "Comment params: #{comment_params.inspect}"
      
        if comment.save
          flash[:success] = "コメントしました"
          redirect_back(fallback_location: root_path)
        else
          flash[:success] = "コメントできませんでした"
          redirect_back(fallback_location: root_path)
        end
      end
      
    
    private
    
        def comment_params
            params.require(:comment).permit(:content, :rate)
        end
end
