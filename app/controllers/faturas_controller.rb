class FaturasController < ApplicationController
  before_action :set_matricula
  before_action :set_matricula_fatura, only: [:show, :update, :destroy]

  # GET /matriculas/:matricula_id/faturas
  def index
    json_response(@matricula.faturas)
  end

  # GET /matriculas/:matricula_id/faturas/:id
  def show
    json_response(@fatura)
  end

  # POST /matriculas/:matricula_id/faturas
  def create
    @matricula.faturas.create!(fatura_params)
    json_response(@matricula, :created)
  end

  # PUT /matriculas/:matricula_id/faturas/:id
  def update
    @fatura.update(fatura_params)
    head :no_content
  end

  # DELETE /matriculas/:matricula_id/faturas/:id
  def destroy
    @fatura.destroy
    head :no_content
  end

  private

  def fatura_params
    params.permit(:valorfatura, :datavencimento, :matricula_id, :status)
  end

  def set_matricula
    @matricula = Matricula.find(params[:matricula_id])
  end

  def set_matricula_fatura
    @fatura = @matricula.faturas.find_by!(id: params[:id]) if @matricula
  end
end
