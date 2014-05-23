class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.all
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
    @partner.attributes = {user: current_user.to_pointer}
    @has_error = false
  end

  # GET /partners/1/edit
  def edit

  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(params[:id])
    @partner.update_attributes(partner_params)
    if @partner.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    @partner = Partner.find(params[:id])
    if @partner.update(partner_params)
      redirect_to @partner, notice: 'Partner was successfully updated.'
    else
      render action: :edit
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to partners_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def partner_params
    params.require(:partner).permit(:name, :address, :email, :phone, :user)
  end
end
