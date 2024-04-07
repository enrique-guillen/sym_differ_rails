# frozen_string_literal: true

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "derivative_expression", to: "derivative_expression#show", only: %i[show]
end
