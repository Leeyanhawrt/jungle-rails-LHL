class Admin::DashboardController < ApplicationController
 
  before_action :authorize

  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def show
    @products = Product.count
    @categories = Category.count
  end
end
