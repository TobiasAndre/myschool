# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClassRoomsController, type: :controller do
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

  describe 'GET #show' do
    let!(:class_room) { create :class_room }

    it 'should success and render to edit page' do
      get :show, params: { id: class_room.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'should assign the class_room object' do
      expect(assigns(:class_room)).to be_an_instance_of(ClassRoom)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when it has valid parameters' do
      it 'creates a class room whit correct attributes' do
        class_attributes = FactoryBot.attributes_for(:class_room)
        post :create, params: { class_room: class_attributes }
        expect(ClassRoom.last).to have_attributes(class_attributes)
      end
    end

    it 'creates a class room' do
      class_room = create(:class_room)
      expect {
        post :create, params: { class_room: { name: class_room.name } }
      }.to change(ClassRoom, :count).by(1)
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @new_class_room_attributes = attributes_for(:class_room)
      request.env['HTTP_ACCEPT'] = 'application/json'
    end

    context 'Try to update class_room name' do
      before(:each) do
        class_room = create(:class_room)
        put :update, params: { id: class_room.id,
                               class_room: @new_class_room_attributes }
      end

      it 'Class Room have the new attributes' do
        expect(ClassRoom.last.name).to eq(@new_class_room_attributes[:name])
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:class_room) { create :class_room }

    it 'should destroy class room' do
      get :destroy, params: { id: class_room.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to action: :index
    end
  end
end
