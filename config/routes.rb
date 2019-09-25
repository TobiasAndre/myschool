# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :teachers
  resources :class_rooms
  resources :disciplines
  resources :students
  match 'pages/provider_reports' => 'pages#provider_reports', via: %i[get post], as: :provider_reports
end
