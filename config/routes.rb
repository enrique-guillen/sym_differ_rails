# frozen_string_literal: true

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "derivative_expression", to: "derivative_expressions#show"

  get "derivative_expression_visualization", to: "derivative_expression_visualizations#show"

  get "first_order_differential_equation_approximation", to: "first_order_differential_equation_approximations#show"

  get "differential_equation_approximation_illustration", to: "differential_equation_approximation_illustrations#show"
end
