class User::DashboardController < Admin::BaseController

  def index
    @orders = Order.all
  end
end
