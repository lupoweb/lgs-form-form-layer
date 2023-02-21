module DeviseHelper
  def devise_error_messages!
    return '' if ( resource.errors.empty? && flash.blank? )

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    flash_alerts = []
    flash_alerts.push(flash[:error]) if flash[:error]
    flash_alerts.push(flash[:alert]) if flash[:alert]
    flash_alerts.push(flash[:notice]) if flash[:notice]

    if flash_alerts.present?
      messages += flash_alerts.map { |msg| content_tag(:li, msg) }.join
    end

    html = <<-HTML
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
      </button>

      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def user_flash_messages!(resource)
    return '' if ( resource.errors.empty? && flash.blank? )

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    flash_alerts = []
    flash_alerts.push(flash[:error]) if flash[:error]
    flash_alerts.push(flash[:alert]) if flash[:alert]
    flash_alerts.push(flash[:notice]) if flash[:notice]
    flash_alerts.push(flash[:success]) if flash[:success]

    if flash_alerts.present?
      messages += flash_alerts.map { |msg| content_tag(:li, msg) }.join
    end

    alert_class = 'danger'

    html = <<-HTML
    <div class="alert alert-#{alert_class} alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
      </button>

      #{messages}
    </div>
    HTML

    html.html_safe
  end
end