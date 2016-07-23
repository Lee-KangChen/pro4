class ConnectionsController < ApplicationController
# 所有controller都繼承ApplicationController這個class
  def index
    @connections = Connection.all
    # 要先新增users這個table
  end
end