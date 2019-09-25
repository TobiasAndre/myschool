# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
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

    it 'should assign the students object' do
      expect(assigns(:student)).to be_an_instance_of(Student)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    let!(:student) { create :student }

    it 'should success and render to edit page' do
      get :show, params: { id: student.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'when it has valid parameters' do
      it 'creates a students with correct attributes' do
        class_room = create(:class_room)
        student_attributes = { name: 'student name',
                               class_room_id: class_room.id }
        post :create, params: { student: student_attributes }
        expect(Student.last).to have_attributes(student_attributes)
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @new_student_attributes = attributes_for(:student)
      request.env['HTTP_ACCEPT'] = 'application/json'
    end

    context 'Try to update student name' do
      before(:each) do
        student = create(:student)
        put :update, params: { id: student.id,
                               student: @new_student_attributes }
      end

      it 'Student have the new attributes' do
        expect(Student.last.name).to eq(@new_student_attributes[:name])
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:student) { create :student }

    it 'should destroy class room' do
      get :destroy, params: { id: student.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to action: :index
    end
  end
end
