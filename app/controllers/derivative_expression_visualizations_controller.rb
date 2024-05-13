# frozen_string_literal: true

require "sym_differ/visualize_expression_and_derivative_expression_interactor"
require "sym_differ/error"

# Allows visualization the derivative of a given expression.
class DerivativeExpressionVisualizationsController < ApplicationController
  include SymDifferExceptionHandlingConcern
  include AccessControlConcern

  def show
    response = visualize

    send_data response.image, type: "image/svg+xml"
  rescue SymDiffer::Error => e
    handle_sym_differ_error(e)
  end

  private

  def visualize
    @operation_response =
      visualize_interactor.visualize(params.fetch(:expression), params.fetch(:variable))
  end

  def visualize_interactor
    SymDiffer::VisualizeExpressionAndDerivativeExpressionInteractor.new
  end
end
