class DashboardController < PlatformsController

  def index
    @mediations = current_user.mediations
  end
end