require 'rails_helper'

RSpec.describe "/players", type: :request do
  let(:valid_attributes) {
    {
      first_name: 'Bart',
      last_name: 'Simpson'
    }
  }

  let(:invalid_attributes) {
    {
      first_name: 'Krusty',
      last_name: ''
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Player.create! valid_attributes
      get players_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      player = Player.create! valid_attributes
      get player_url(player)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_player_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      player = Player.create! valid_attributes
      get edit_player_url(player)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Player" do
        expect {
          post players_url, params: { player: valid_attributes }
        }.to change(Player, :count).by(1)
      end

      it "redirects to the created player" do
        post players_url, params: { player: valid_attributes }
        expect(response).to redirect_to(player_url(Player.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Player" do
        expect {
          post players_url, params: { player: invalid_attributes }
        }.to change(Player, :count).by(0)
      end

      it "returns an unprocessable entity response" do
        post players_url, params: { player: invalid_attributes }

        expect(response.status).to eq(422)
        expect(response).to be_unprocessable
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          first_name: 'Moe',
          last_name: 'Szyslak',
        }
      }

      it "updates the requested player" do
        player = Player.create! valid_attributes
        patch player_url(player), params: { player: new_attributes }
        player.reload
        expect(player).to have_attributes(
          first_name: 'Moe',
          last_name: 'Szyslak',
        )
      end

      it "redirects to the player" do
        player = Player.create! valid_attributes
        patch player_url(player), params: { player: new_attributes }
        player.reload
        expect(response).to redirect_to(player_url(player))
      end
    end

    context "with invalid parameters" do
      it "returns an unprocessable entity response" do
        player = Player.create! valid_attributes
        patch player_url(player), params: { player: invalid_attributes }

        expect(response.status).to eq(422)
        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested player" do
      player = Player.create! valid_attributes
      expect {
        delete player_url(player)
      }.to change(Player, :count).by(-1)
    end

    it "redirects to the players list" do
      player = Player.create! valid_attributes
      delete player_url(player)
      expect(response).to redirect_to(players_url)
    end
  end
end
