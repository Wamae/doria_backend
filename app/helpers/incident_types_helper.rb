module IncidentTypesHelper

  def render_incident_types(selected_incident_type, cls = '')
    incident_types = IncidentType.all
    options = selected_incident_type ? { selected: selected_incident_type.id } : { prompt: 'Select incident type' }
    select('incident', 'incident_type_id', incident_types
                                                    .collect { |incident_type| [incident_type.name, incident_type.id] }, options, :class => cls, required: true)
  end
end
