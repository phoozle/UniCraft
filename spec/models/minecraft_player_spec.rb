require 'spec_helper'

describe MinecraftPlayer do
  describe "generate_activation_code" do
    let(:mincraft_player) { create(:minecraft_player) }
    subject { mincraft_player.verification_code }
    its(:length) { should eq(32) }
  end
end
