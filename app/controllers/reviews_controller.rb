class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @review = Review.new
  end

  def create
   @group = Group.find(params[:group_id])
   @review = Review.new(post_params)
   @review.group = @group
   @review.user = current_user

   if @review.save
     redirect_to group_path(@group)
   else
     render :new
   end
 end

 private

  def post_params
    params.require(:review).permit(:content)
  end

end
