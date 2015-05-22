class MicropostsController < ApplicationController
  before_action :signed_in_user, only:[:create, :destroy]

  def index

  end

  def create
    @micropost = current_user.micropost.build(micropst_params)
    if @micropost.save
      flash[:success] = "Micropost create!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end


  def destroy

  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
