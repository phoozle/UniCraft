require 'spec_helper'

describe MinecraftPlayer do
  describe "#generate_activation_code" do
    let(:mincraft_player) { create(:minecraft_player) }
    subject { mincraft_player.verification_code }
    its(:length) { should eq(32) }
  end

  context "#activate" do
    before {
      @minecraft_player = create(:minecraft_player)
      @minecraft_player.activate!
    }

    subject { @minecraft_player }

    describe "activates the account" do
      its(:active) { should be_true }
    end

    describe "nils the verification_code" do
      its(:verification_code) { should be_nil }
    end
  end
end
