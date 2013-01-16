class MinecraftPlayerMailer < ActionMailer::Base
  default from: "noreply"

  def verify(minecraft_player)
    @minecraft_player = minecraft_player
    mail(:to => @minecraft_player.email, :subject => "Unicraft - Verify")
  end
end
