require 'spec_helper'

describe "Creating a new user" do
  before {
    ENV["api_key"] = "secret"
    post api_minecraft_players_path, :minecraft_player => {:username => "steve", :email => "abcd001@mymail.unisa.edu.au"}, :api_key => "secret"
  }

  context "sends a verification email" do
    describe "to the correct address" do
      subject { last_email }
      it { should deliver_to("abcd001@mymail.unisa.edu.au") }
    end

    describe "that when followed will activate the account" do
      before {
        open_email("abcd001@mymail.unisa.edu.au")
        click_first_link_in_email
      }

      subject { MinecraftPlayer.last }

      its(:active) { should be_true }
    end
  end
end
