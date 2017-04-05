class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

def edit
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
end

end
