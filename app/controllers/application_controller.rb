class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart
  helper_method :current_user
  helper_method :sort_methods
  helper_method :logged_in?

  def sort_methods
    [
      ["Price, Low to High", "price ASC"],
      ["Price, High to Low", "price DESC"],
      ["Alphabetically, A-Z", "title ASC"],
      ["Alphabetically, Z-A", "title DESC"]
    ]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end
end
