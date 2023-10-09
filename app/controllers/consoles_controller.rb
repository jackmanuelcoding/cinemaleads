class ConsolesController < ApplicationController
  before_action :authenticate_user!

  def show
    @leads = Lead.all.order(:country)

    authorize :console, :show?
  end
end
