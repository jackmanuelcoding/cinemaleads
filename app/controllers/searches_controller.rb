class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:q]

    @leads =
      Lead
        .all
        .order(:country, :company)
        .where(
          Lead.arel_table[:country]
            .lower
            .matches("%#{query}%")
            .or(Lead.arel_table[:company].lower.matches("%#{query}%"))
        )
  end
end
