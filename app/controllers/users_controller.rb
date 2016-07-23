class UsersController < ApplicationController
# 所有controller都繼承ApplicationController這個class
  def index
  	#binding.pry
    @users = User.all
    # 要先新增users這個table
  end
end