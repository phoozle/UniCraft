class Api::MinecraftPlayersController < ApplicationController

  before_filter :authenticate
  skip_before_filter :verify_authenticity_token

  def show
    minecraft_player = MinecraftPlayer.find_by_username(params[:id])

    if minecraft_player.try(:active?)
      render :text => "OK", :status => 200
    else
      render :text => "ERR", :status => 200
    end
  end

  def create
    minecraft_player = MinecraftPlayer.new(params[:minecraft_player].permit(:username, :email))

    if minecraft_player.save
      MinecraftPlayerMailer.verify(minecraft_player).deliver
      head :created
    else
      render :text => minecraft_player.errors, :status => 500
    end
  end

private

  def authenticate
    head :unauthorized if params[:api_key].blank? || params[:api_key] != ENV["API_KEY"]
  end
end
