class ConsolesController < ApplicationController
  before_action :authenticate_user!

  def show
    @leads = Lead.all.order(:country, :company)

    authorize :console, :show?
  end
end
