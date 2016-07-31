class CommentsController < ApplicationController
# 所有controller都繼承ApplicationController這個class
  def index
    @comments = Comment.all
    # 要先新增users這個table
  end
# added comment form in post show page／13  app/controllers/comments_controller.rb
	def create
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.build(params.require(:comment).permit(:content))
	 	@comment.user = current_user	# setting users when creating new post and comment objects
	  if @comment.save
	    redirect_to post_path(@post)
	  else
	    render 'posts/show'
	  end
	end

	def vote
	  @comment = Comment.find(params[:id])
	  @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

	  if @vote.valid?
	    flash[:success] = 'Your vote was counted!'
	  else
	    flash[:error] = "You can only vote for this comment once!".html_safe
	  end
	  redirect_to :back
	end

end