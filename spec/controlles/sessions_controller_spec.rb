require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  describe 'Create session' do
    context 'log in with valid parameters' do
      let!(:user) { FactoryBot.create(:user) }

      before do
        post '/users/sessions', params:
                            { user: {
                              email: user.email,
                              password: user.password
                            } }
      end
      it 'returns the logged in status' do
        expect(json['logged_in']).to eq(true)
      end
      it 'returns successed code status' do
        expect(json['status']).to eq(201)
      end
    end

    context 'log in with invalid parameters' do
      before do
        post '/users/sessions', params:
                            { user: {
                              email: '',
                              password: ''
                            } }
      end

      it 'returns errors message' do
        expect(json['errors']).to eq('User in not find or password is incorrect')
      end

      it 'returns bad code status' do
        expect(json['status']).to eq(422)
      end
    end
  end

  describe 'check logged in status' do

    context 'user is logged in' do
      let!(:user) { FactoryBot.create(:user) }

      before do
        post '/users/sessions', params:
                            { user: {
                              email: user.email,
                              password: user.password
                            } }
        get '/users/logged_in'
      end

      it 'returns that logged in' do
        expect(json['logged_in']).to eq(true)
      end

      it 'returns current user id' do
        expect(json['user']['id']).to eq(user.id)
      end
    end

    context 'user is not logged in' do
      before do
        get '/users/logged_in'
      end

      it 'return that is not logged in' do
        expect(json['logged_in']).to eq(false)
      end
    end
  end

  describe 'logout' do

    context 'successfully logout' do
      before do
        delete '/users/logout'
      end

      it 'returns success logout' do
        expect(json['logged_out']).to eq(true)
      end
    end
  end
end
