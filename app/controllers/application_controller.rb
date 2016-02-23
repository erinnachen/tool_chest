class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool, :current_tool_summary

  def most_recent_tool
    @most_recent_tool ||= Tool.find(session[:most_recent_tool_id]) if session[:most_recent_tool_id]
  end

  def current_tool_summary
    "Current tool count: #{session[:current_tool_count].to_i}
     Current potential revenue: $#{session[:current_potential_revenue].to_f}"
  end
end
