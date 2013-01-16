class MinecraftPlayerMailer < ActionMailer::Base
  default from: "noreply"

  def verify_email(minecraft_player)
    mail(:to => minecraft_player.email, :subject => "Unicraft - Verify")
  end
end
