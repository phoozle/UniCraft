require 'spec_helper'

describe Api::MinecraftPlayersController do
  let(:minecraft_player) { { :username => "steve", :email => "steve@apple.com" } }

  after {
    MinecraftPlayer.destroy_all
  }

  context "#show" do
    describe "displays OK for active MinecraftPlayer" do
      before {
        ENV["API_KEY"] = "secret"

        @minecraft_player = create(:minecraft_player, minecraft_player)
        @minecraft_player.activate!
        get :show, :id => @minecraft_player.username, :api_key => "secret"
      }

      subject { response.body }

      it { should eq("OK") }
    end

    describe "displays ERR for in-active MinecraftPlayer" do
      before {
        ENV["API_KEY"] = "secret"

        @minecraft_player = create(:minecraft_player, minecraft_player)
        get :show, :id => @minecraft_player.username, :api_key => "secret"
      }

      subject { response.body }

      it { should eq("ERR") }
    end

    describe "displays ERR for no MinecraftPlayer" do
      before {
        ENV["API_KEY"] = "secret"

        get :show, :id => minecraft_player[:username], :api_key => "secret"
      }

      subject { response.body }

      it { should eq("ERR") }
    end
  end

  context "#create" do
    describe "a new MinecraftPlayer" do
      before {
        ENV["API_KEY"] = "secret"
        post :create, :minecraft_player => minecraft_player, :api_key => "secret"
      }

      subject { MinecraftPlayer.last }

      it { should_not be_nil }
    end

    context "authentication" do
      describe "does not create a new MinecraftPlayer with invalid API key" do
        before {
          ENV["API_KEY"] = "secret"
          post :create, :minecraft_player => minecraft_player, :api_key => "wrong_key"
        }

        specify {
          MinecraftPlayer.last.should be_nil
          response.status.should eq(401)
        }
      end

      describe "does not create a new MinecraftPlayer when no API key is used" do
        before {
          ENV["API_KEY"] = nil
          post :create, :minecraft_player => minecraft_player
        }

        specify {
          MinecraftPlayer.last.should be_nil
          response.status.should eq(401)
        }
      end
    end
  end
end
