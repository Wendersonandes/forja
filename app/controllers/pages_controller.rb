class PagesController < ApplicationController
  layout "landing", only: [:landing]

  def landing
    # Landing page para visitantes
  end
end
