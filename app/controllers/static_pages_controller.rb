class StaticPagesController < ApplicationController
  def home
    @organizations = Organization.all
  end
end
