class SessionsController < ApplicationController
    def destroy
        reset_session  # セッションをリセットしてログアウト
        redirect_to root_path, notice: "ログアウトしました"
    end
end
