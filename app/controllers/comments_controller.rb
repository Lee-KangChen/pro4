class CommentsController < ApplicationController
# 所有controller都繼承ApplicationController這個class
  def index
    @comments = Comment.all
    # 要先新增users這個table
  end
end