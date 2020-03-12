module Api
  module Private
    module V1
      class ApplicationController < ActionController::Base
        protect_from_forgery with: :null_session


        private

        def authenticate_user
          @current_user = User.find_by(access_token: request.headers['Authorization'])
          unless (@current_user)
            render json: { success: false, message: 'Unauthorized', data: nil }, status: :unauthorized
          end
        end
      end
    end
  end
end
