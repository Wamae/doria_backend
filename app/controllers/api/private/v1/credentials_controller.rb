module Api
  module Private
    module V1
      class CredentialsController < ApplicationController
        before_action :authenticate_user, except: [:login]

        def login
          email = params[:email]
          password = params[:password]

          if email && password
            user = User.find_by(email: email)
            if user
              if user.valid_password?(password)
                user.access_token = SecureRandom.uuid
                if user.save
                  render json: { success: true, message: 'Logged in successfully', data: { token: user.access_token } }.to_json, status: :ok
                end
              else
                render json: { success: false, message: 'Incorrect username and password', data: nil }, status: :unauthorized
              end
            else
              render json: { success: false, message: 'Incorrect username and password', data: nil }, status: :unauthorized
            end
          else
            render json: { success: false, message: 'Enter username and password', data: nil }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
