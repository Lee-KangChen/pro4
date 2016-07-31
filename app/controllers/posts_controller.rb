class PostsController < ApplicationController
# 所有controller都繼承ApplicationController這個class
  def index
    @posts = Post.all.sort_by {|x| x.total_votes }.reverse
    # @posts = Post.all   # 右邊是連到mbdel；mbdel連到db;@posts是區域變數，連到view;s與否是表示找到的資料是否是一筆
    # view --> controller --> modle    
    # 排序用
    @post = Post.find(1)
    # 要先新增users這個table
    # 意即去 Post model，也就是 posts table 找出每一筆資料，存進 @posts 變數
  end

  #在 Post Controller 裡面新增 show
  def show
    #Rails 會把用戶所有傳進來的參數打包成一個叫 params 的 Hash
    #find 代表搜尋某一比資料，而 params[:id] 代表用戶想查詢的資料 id

    @post = Post.find(params[:id])
    # post 改為posts 
    # added comment form in post show page／13  app/controllers/comments_controller.rb
    @comment = Comment.new
    @comments = @post.comments.all.sort_by {|x| x.total_votes }.reverse
  end
  
# 講義8,為了show留言

# 以下為 實作 Post 表單
  def new
    #產出一個空白物件(一筆空白資料)，並顯示在 posts/new 頁面
    @post = Post.new
  end

  def create
    #前端使用者傳回的資料，建立一個新的 post 物件
    post = Post.new(post_params)
    post.user = current_user # setting users when creating new post and comment objects
    #如果成功存進資料庫，就導回 index 頁面，失敗就再顯示一次表單
    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def vote
     @post = Post.find(params[:id])
     @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
 
     if @vote.valid?
       flash[:success] = 'Your vote was counted!'
     else
        flash[:error] = "You can only vote for #{@post.title} once!".html_safe
     end
 
     redirect_to :back
  end

  private

  #確保 params 裡面的 post hash 存在，並且允許 title 和 content 被存取
  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end

end

