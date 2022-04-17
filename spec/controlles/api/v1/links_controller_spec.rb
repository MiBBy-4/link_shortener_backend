require 'rails_helper'

RSpec.describe 'LinksController', type: :request do
  describe 'GET /api/v1/links' do
    before do
      FactoryBot.create(:user)
      FactoryBot.create_list(:link, 5)
      get '/api/v1/links'
    end

    it 'return all link with json' do
      expect(json.size).to eq(5)
    end

    it 'return success status of response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:full_link) { FactoryBot.create(:link) }

    context 'with valid parameters' do
      before do
        post '/api/v1/links', params:
                          { link: {
                            base_link: full_link.base_link,
                            description: full_link.description,
                            user_id: user.id
                          },
                           tags: []
                        }
      end

      it 'returns the base link' do
        expect(json['link']['base_link']).to eq(full_link.base_link)
      end

      it 'returns the description' do
        expect(json['link']['description']).to eq(full_link.description)
      end

      it 'returns the user id' do
        expect(json['link']['user_id']).to eq(user.id)
      end

      it 'returns a created status' do
        expect(json['status']).to eq(201)
      end
    end
  end
end