require "spec_helper"

describe MinecraftPlayerMailer do
  context "#verify" do
    let(:user) { create(:minecraft_player) }
    let(:email) { MinecraftPlayerMailer.verify(user) }
    subject { email.body }

    describe "contains a valid activation link" do
      it { should have_content("/verify/#{user.verification_code}") }
    end
  end
end
