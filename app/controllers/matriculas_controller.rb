class MatriculasController < ApplicationController
    before_action :set_matricula, only: [:show, :update, :destroy]


    # GET /matriculas
    def index
      @matriculas = Matricula.all
      json_response(@matriculas)
    end

    # POST /matriculas
    def create
      @matricula = Matricula.create!(matricula_params)
      @matricula.generate_fatura
      if Rails.env.test?
        @matricula.send_welcome_mail(Ie.find(@matricula.ie_id),
                                     Aluno.find(@matricula.aluno_id))
      end
      json_response(@matricula, :created)
    end

    # GET /matriculas/:id
    def show
      json_response(@matricula)
    end

    # PUT /matriculas/:id
    def update
      @matricula.update(matricula_params)
      head :no_content
    end

    # DELETE /matriculas/:id
    def destroy
      @matricula.destroy
      head :no_content
    end

    private

    def matricula_params
      # whitelist params
      params.permit(:valortotal, :fatura, :diavencimento, :curso, :ie_id, :aluno_id)
    end

    def set_matricula
      @matricula = Matricula.find(params[:id])
    end
end
