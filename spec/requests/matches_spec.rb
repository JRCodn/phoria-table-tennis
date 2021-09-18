require 'rails_helper'

RSpec.describe "/matches", type: :request do
  let(:valid_attributes) do
    {
      score: '21-10',
      time: Time.zone.now
    }
  end

  let(:invalid_attributes) {
    {
      score: '21-10',
      time: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Match.create! valid_attributes
      get matches_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      match = Match.create! valid_attributes
      get match_url(match)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_match_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      match = Match.create! valid_attributes
      get edit_match_url(match)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Match" do
        expect {
          post matches_url, params: { match: valid_attributes }
        }.to change(Match, :count).by(1)
      end

      it "redirects to the created match" do
        post matches_url, params: { match: valid_attributes }
        expect(response).to redirect_to(match_url(Match.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Match" do
        expect {
          post matches_url, params: { match: invalid_attributes }
        }.to change(Match, :count).by(0)
      end

      it "returns an unprocessable entity response" do
        post matches_url, params: { match: invalid_attributes }

        expect(response.status).to eq(422)
        expect(response).to be_unprocessable
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          score: '21-19'
        }
      }

      it "updates the requested match" do
        match = Match.create! valid_attributes
        patch match_url(match), params: { match: new_attributes }
        match.reload
        expect(match).to have_attributes(
          score: '21-19'
        )
      end

      it "redirects to the match" do
        match = Match.create! valid_attributes
        patch match_url(match), params: { match: new_attributes }
        match.reload
        expect(response).to redirect_to(match_url(match))
      end
    end

    context "with invalid parameters" do
      it "returns an unprocessable entity response" do
        match = Match.create! valid_attributes
        patch match_url(match), params: { match: invalid_attributes }

        expect(response.status).to eq(422)
        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested match" do
      match = Match.create! valid_attributes
      expect {
        delete match_url(match)
      }.to change(Match, :count).by(-1)
    end

    it "redirects to the matches list" do
      match = Match.create! valid_attributes
      delete match_url(match)
      expect(response).to redirect_to(matches_url)
    end
  end
end
