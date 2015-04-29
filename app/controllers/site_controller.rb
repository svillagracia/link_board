class SiteController < ApplicationController

  before_action :is_authenticated?, only: [:home]

  def index
  end

  def about
  end

  def home
  end

end