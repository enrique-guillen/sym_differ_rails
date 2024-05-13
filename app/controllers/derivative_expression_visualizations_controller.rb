# frozen_string_literal: true

require "sym_differ/visualize_expression_and_derivative_expression_interactor"
require "sym_differ/error"

# Allows visualization the derivative of a given expression.
class DerivativeExpressionVisualizationsController < ApplicationController
  def show
    set_access_control_allow_origin_to_localhost
    visualize

    send_data @operation_response.image, type: "image/svg+xml"
  rescue SymDiffer::Error => e
    @sym_differ_exception = e.cause || e
    view_name = view_name_for_exception_cause(e)

    render "global_exceptions/#{view_name}", status: :unprocessable_entity, formats: %i[json]
  end

  private

  def set_access_control_allow_origin_to_localhost
    response.set_header("Access-Control-Allow-Origin", "http://localhost:5173")
  end

  def visualize
    @operation_response =
      visualize_interactor.visualize(params.fetch(:expression), params.fetch(:variable))
  end

  def view_name_for_exception_cause(exception)
    return underscore_class_name(exception.cause) if exception.cause

    underscore_class_name(exception)
  end

  def underscore_class_name(object)
    object.class.name.underscore.split("/").last
  end

  def visualize_interactor
    SymDiffer::VisualizeExpressionAndDerivativeExpressionInteractor.new
  end
end
