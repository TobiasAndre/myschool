# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'should assign the discipline object' do
      expect(assigns(:discipline)).to be_an_instance_of(Discipline)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    let!(:discipline) { create :discipline }

    it 'should success and render to edit page' do
      get :show, params: { id: discipline.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'when it has valid parameters' do
      it 'creates a discipline with correct attributes' do
        discipline_attributes = FactoryBot.attributes_for(:discipline)
        post :create, params: { discipline: discipline_attributes }
        expect(Discipline.last).to have_attributes(discipline_attributes)
      end
    end
  end

  describe 'PUT #update' do
    render_views
    before(:each) do
      @new_discipline_attributes = attributes_for(:discipline)
      request.env['HTTP_ACCEPT'] = 'application/json'
    end

    context 'Try to update discipline name' do
      before(:each) do
        discipline = create(:discipline)
        put :update, params: { id: discipline.id,
                               discipline: @new_discipline_attributes }
      end

      it 'Discipline have the new attributes' do
        expect(Discipline.last.name).to eq(@new_discipline_attributes[:name])
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:discipline) { create :discipline }

    it 'should destroy discipline' do
      get :destroy, params: { id: discipline.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to action: :index
    end
  end
end
