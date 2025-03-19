class TweetsController < ApplicationController
    before_action :authenticate_user! 

    def index
        @tweets = Tweet.all
        @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
        @tweets = params[:tag_id].present? ? Tag.find(params[:tag_id]).tweets : Tweet.all

        if params[:latest]
            @tweets = @tweets.latest
            elsif params[:old]
                @tweets = @tweets.old
            elsif params[:star_count]
                @Tweets = @tweets.star_count
                else
                @tweets = @tweets.all
        end

        @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(3)
    end

    def new
        @tweet = Tweet.new
    end

        def create
            tweet = Tweet.new(tweet_params)

            tweet.user_id = current_user.id

            if tweet.save
                redirect_to :action => "index"
            else
                redirect_to :action => "new"
            end
        end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit
        @tweets = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private
    def tweet_params
        params.require(:tweet).permit(:body, :image)
        params.require(:tweet).permit(:title, :servings, :quantities, :body, :image, tag_ids: [])
    end

    def article_params
        params.require(:article).permit(:body, tag_ids: [])
    end
    
end
