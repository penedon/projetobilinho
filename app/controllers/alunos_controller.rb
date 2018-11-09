class AlunosController < ApplicationController
  before_action :set_alunos, only: [:show, :update, :destroy]

  # GET /alunos
  def index
    @alunos = Aluno.all
    json_response(@alunos)
  end

  # POST /alunos
  def create
    @aluno = Aluno.create!(alunos_params)
    json_response(@aluno, :created)
  end

  # GET /alunos/:id
  def show
    json_response(@aluno)
  end

  # PUT /alunos/:id
  def update
    @aluno.update(alunos_params)
    head :no_content
  end

  # DELETE /alunos/:id
  def destroy
    @aluno.destroy
    head :no_content
  end

  private

  def alunos_params
    # whitelist params
    params.permit(:nome, :cpf, :dnascimento, :celular,
                  :genero, :tipopagamento)
  end

  def set_alunos
    @aluno = Aluno.find(params[:id])
  end
end
