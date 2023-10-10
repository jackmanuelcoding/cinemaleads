class LeadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @leads = Lead.all.order(:country, :company)

    if params[:category].present?
      @leads =
        Lead.all.order(:country, :company).where(category: params[:category])
    end
  end

  def new
    @lead = Lead.new

    authorize @lead
  end

  def create
    @lead = current_user.leads.new(lead_params)

    authorize @lead

    if @lead.save
      redirect_to console_path,
                  notice: "#{@lead.company} has been added to leads."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lead = current_user.leads.find(params[:id])

    authorize @lead
  end

  def update
    @lead = current_user.leads.find(params[:id])

    authorize @lead

    if @lead.update(lead_params)
      redirect_to console_path, notice: "#{@lead.company} has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])

    authorize @lead

    @lead.destroy
    redirect_to console_path,
                notice: "#{@lead.company} has been removed from leads.",
                status: :see_other
  end

  private

  def lead_params
    params.require(:lead).permit(
      :country,
      :company,
      :website,
      :linkedin,
      :email,
      :phone,
      :category
    )
  end
end
