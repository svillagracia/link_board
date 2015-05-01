class SiteController < ApplicationController

  before_action :is_authenticated?, only: [:home]

  def index
    @post = Post.all
    @vote = Vote.new
    respond_to do |format|
      format.json{ render json:@posts }
      format.xml{ render xml:@posts }
      format.html
    end
  end

  def about
  end

  def home
  end

end