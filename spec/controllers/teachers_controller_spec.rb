# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
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

    it 'should assign the teachers object' do
      expect(assigns(:teacher)).to be_an_instance_of(Teacher)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    let!(:teacher) { create :teacher }

    it 'should success and render to edit page' do
      get :show, params: { id: teacher.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'when it has valid parameters' do
      it 'creates a teachers with correct attributes' do
        teacher_attributes = FactoryBot.attributes_for(:teacher)
        post :create, params: { teacher: teacher_attributes }
        expect(Teacher.last).to have_attributes(teacher_attributes)
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @new_teacher_attributes = attributes_for(:teacher)
      request.env['HTTP_ACCEPT'] = 'application/json'
    end

    context 'Try to update teacher name' do
      before(:each) do
        teacher = create(:teacher)
        put :update, params: { id: teacher.id,
                               teacher: @new_teacher_attributes }
        expect(response).to redirect_to teachers_path
      end

      it 'Teacher have the new attributes' do
        expect(Teacher.last.name).to eq(@new_teacher_attributes[:name])
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:teacher) { create :teacher }

    it 'should destroy class room' do
      get :destroy, params: { id: teacher.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to action: :index
    end
  end
end
