class Admin::BaseController < ApplicationController
  before_action :require_user
  before_action :current_admin?

  def require_user
    render file: "/public/404" unless current_user
  end
end
