# frozen_string_literal: true

require "sym_differ/get_derivative_of_expression_interactor"
require "sym_differ/error"

# Allows computing the derivative of a given expression.
class DerivativeExpressionsController < ApplicationController
  include SymDifferExceptionHandlingConcern
  include AccessControlConcern

  def show
    calculate_derivate
    render formats: %i[json]
  rescue SymDiffer::Error => e
    handle_sym_differ_error(e)
  end

  private

  def calculate_derivate
    @operation_response =
      calculate_interactor.calculate_derivative(params.fetch(:expression), params.fetch(:variable))
  end

  def calculate_interactor
    SymDiffer::GetDerivativeOfExpressionInteractor.new
  end
end
