require 'rails_helper'

RSpec.describe 'RegistrationController', type: :request do

  describe 'user registration' do
    let!(:email) { Faker::Internet.email }
    let!(:password) { Faker::Internet.password }
    let!(:just_sentence) { Faker::Lorem.sentence }

    context 'with valid parameters' do
      before do
        post '/users/registrations', params:
                            { user: {
                              email: email,
                              password: password,
                              password_confirmation: password
                            } }
      end
      it 'returns the email' do
        expect(json['user']['email']).to eq(email)
      end

      it 'return success code status' do
        expect(json['status']).to eq(201)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/users/registrations', params:
                            { user: {
                              email: just_sentence,
                              password: password,
                              password_confirmation: password
                            } }
      end

      it 'returns error message that email is invalid' do
        expect(json['errors'].include?('Email is invalid')).to eq(true)
      end

      it 'returns bad code status' do
        expect(json['status']).to eq(422)
      end
    end
  end
end
