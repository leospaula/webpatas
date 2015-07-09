module ApplicationHelper
  def ui_component partial_name
    render "components/#{partial_name}"
  end
end
