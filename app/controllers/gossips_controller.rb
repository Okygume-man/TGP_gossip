class GossipsController < ApplicationController
  def index
  	@gossips = Gossip.all
  end

  def create
  	@user = User.create(first_name: params[:gossip_user])
  	@gossip = Gossip.create(content: params[:gossip_content], user_id: @user.id, title: params[:gossip_title])

  	if @gossip.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to :gossips
    else
    	flash[:danger] = "NOPE TU AS TORT"
      render :new
    end

  end
end
