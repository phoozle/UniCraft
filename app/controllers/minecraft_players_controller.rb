class MinecraftPlayersController < ApplicationController
  def verify
    if @minecraft_player = MinecraftPlayer.find_by_verification_code(params[:verification_code])
      @minecraft_player.activate!
    end
  end
end
