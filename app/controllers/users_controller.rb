class UsersController < ApplicationController
# 所有controller都繼承ApplicationController這個class
def show
  @user = User.find(params[:id])
end
  def new
  	#binding.pry
    @user = User.new
    # 要先新增users這個table
  end
  def create
  	@user = User.new(user_params)
 
  	if @user.save
    	binding.pry
    	redirect_to root_path
   	else
    	render :new
   	end
 	end
 
	private 
 
	def user_params
   params.require(:user).permit(:name, :password)
 end
end