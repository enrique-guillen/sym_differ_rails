# frozen_string_literal: true

require "sym_differ/get_derivative_of_expression_director"

# Allows computing the derivative of a given expression.
class DerivativeExpressionController < ApplicationController
  def show
    @operation_response =
      SymDiffer::GetDerivativeOfExpressionDirector
      .new
      .calculate_derivative(params.require(:expression), params.require(:variable))

    render(formats: %i[json])
  end
end
