class IesController < ApplicationController
  before_action :set_ie, only: [:show, :update, :destroy]

  # GET /ies
  def index
    @ies = Ie.all
    json_response(@ies)
  end

  # POST /ies
  def create
    @ie = Ie.create!(ie_params)
    puts @ie
    json_response(@ie, :created)
  end

  # GET /ies/:id
  def show
    json_response(@ie)
  end

  # PUT /ies/:id
  def update
    @ie.update(ie_params)
    head :no_content
  end

  # DELETE /ies/:id
  def destroy
    @ie.destroy
    head :no_content
  end

  private

  def ie_params
    # whitelist params
    params.permit(:nome, :cnpj, :tipo)
  end

  def set_ie
    @ie = Ie.find(params[:id])
  end
end
