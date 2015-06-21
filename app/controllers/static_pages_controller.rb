class StaticPagesController < ApplicationController
  def home
    @organizations = Organization.all.order(:name)
  end
end
