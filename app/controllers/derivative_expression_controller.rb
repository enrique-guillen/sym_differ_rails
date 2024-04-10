# frozen_string_literal: true

require "sym_differ/get_derivative_of_expression_director"

# Allows computing the derivative of a given expression.
class DerivativeExpressionController < ApplicationController
  def show
    calculate_derivate
    set_access_control_allow_origin_to_localhost
    render(formats: %i[json])
  end

  private

  def calculate_derivate
    @operation_response =
      SymDiffer::GetDerivativeOfExpressionDirector
      .new
      .calculate_derivative(params.require(:expression), params.require(:variable))
  end

  def set_access_control_allow_origin_to_localhost
    response.set_header("Access-Control-Allow-Origin", "http://localhost:5173")
  end
end
