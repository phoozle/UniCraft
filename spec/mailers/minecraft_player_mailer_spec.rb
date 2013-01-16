require "spec_helper"

describe MinecraftPlayerMailer do
  context "#verify_email" do
    let(:user) { build(:minecraft_player) }
    let(:email) { MinecraftPlayerMailer.verify_email(user) }
    subject { email }

    describe "contains a valid activation link" do
      it { should have_content("activation_link") }
    end
  end
end
