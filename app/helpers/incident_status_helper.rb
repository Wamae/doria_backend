module IncidentStatusHelper
  def render_incident_statuses(current_status, cls = '')
    statuses = ['Pending', 'Resolved', 'Cancelled']
    options = current_status ? { selected: current_status } : { prompt: 'Select status' }
    select('incident', 'status', statuses
                                     .collect { |status| [status, status] }, options, :class => cls, required: true)
  end
end
