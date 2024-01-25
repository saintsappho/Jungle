class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  def show
    @category = Category
    @products = Product
  end
end
