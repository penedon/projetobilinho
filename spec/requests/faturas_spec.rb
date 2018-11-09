require 'rails_helper'

RSpec.describe 'Fatura API', type: :request do
  # initialize test data
  let!(:ie) { create(:ie) }
  let!(:aluno) { create(:aluno) }
  let(:ie_id) { ie.id }
  let(:aluno_id) { aluno.id }
  let(:valid_attributes) { {valortotal: 12000, diavencimento: 4, curso: 'Engenharia', fatura: 12,
                                  ie_id: ie_id, aluno_id: aluno_id } }


  let(:matricula_id) { 1 }



  describe 'POST /matriculas/' do
    before { post '/matriculas', params: valid_attributes}

    context 'when matricula exists' do
      before { get "/matriculas/#{matricula_id}/faturas" }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the same amount of faturas as in matricula.fatura' do
         expect(json.size).to eq(valid_attributes[:fatura])
      end

      it 'returns valorfatura = matricula.valor total / matricula.fatura' do
         expect(json.map{|x| x['valorfatura'].to_i}.compact.inject(0, :+)).to eq(valid_attributes[:valortotal])
      end
    end

    context 'when matricula does not exist' do
      let(:matricula_id) { 100}
      before { get "/matriculas/#{matricula_id}/faturas" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Matricula with 'id'=100/)
      end
    end

  end
  # Test suite for GET /matriculas/:matricula_id/faturas


  # # Test suite for GET /matriculas/:matricula_id/faturas/:id
  # describe 'GET /matriculas/:matricula_id/faturas/:id' do
  #   before { get "/matriculas/#{matricula_id}/faturas/#{id}" }
  #   context 'when matricula fatura exists' do
  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #
  #     it 'returns the fatura' do
  #       expect(json['id']).to eq(id)
  #     end
  #   end
  #
  #   context 'when matricula fatura does not exist' do
  #     let(:id) { 0 }
  #
  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end
  #
  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find Fatura/)
  #     end
  #   end
  # end
end
