module Api
  module Private
    module V1
      class IncidentTypesController < ApplicationController
        before_action :authenticate_user

        def index
          # render json: { success: true, message: 'Successfully got incident types', data: IncidentType.all.to_json(only: %i[id name]) }.to_json, status: :ok
          render json: IncidentType.all.to_json(only: %i[id name]), status: :ok
        end

      end
    end
  end
end
