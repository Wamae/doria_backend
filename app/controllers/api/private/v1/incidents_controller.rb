module Api
  module Private
    module V1
      class IncidentsController < ApplicationController
        before_action :authenticate_user
        before_action :set_incident, only: [:show, :edit, :update, :destroy]

        # GET /incidents
        # GET /incidents.json
        def index
          incidents = Incident.joins(:incident_type)
                          .select('incidents.id, incident_types.name, incidents.description, incidents.location, incidents.created_at, incidents.updated_at, incidents.status')
          render json: incidents, status: :ok
        end

        # POST /incidents
        # POST /incidents.json
        def create
          incident = Incident.new(incident_params.merge!(user_id: @current_user.id, status: 'Pending'))

          if incident.save
            render json: { id: incident.id,
                           type: incident.incident_type.name,
                           location: incident.location,
                           description: incident.description }, status: :ok
          else
            format.json { render json: incident.errors, status: :unprocessable_entity }
          end
        end

        # PATCH/PUT /incidents/1
        # PATCH/PUT /incidents/1.json
        def update
          respond_to do |format|
            if @incident.update(incident_params)
              format.json { render :show, status: :ok, location: @incident }
            else
              format.html { render :edit }
              format.json { render json: @incident.errors, status: :unprocessable_entity }
            end
          end
        end

        # DELETE /incidents/1
        # DELETE /incidents/1.json
        def destroy
          @incident.destroy
          respond_to do |format|
            format.json { head :no_content }
          end
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_incident
          @incident = Incident.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def incident_params
          params.permit(:incident_type_id, :location, :description)
        end
      end
    end
  end
end
