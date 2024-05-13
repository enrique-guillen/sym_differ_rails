# frozen_string_literal: true

require "sym_differ/get_derivative_of_expression_interactor"
require "sym_differ/error"

# Allows computing the derivative of a given expression.
class DerivativeExpressionsController < ApplicationController
  def show
    set_access_control_allow_origin_to_localhost
    calculate_derivate

    render formats: %i[json]
  rescue SymDiffer::Error => e
    @sym_differ_exception = e.cause || e
    view_name = view_name_for_exception_cause(e)

    render "global_exceptions/#{view_name}", status: :unprocessable_entity, formats: %i[json]
  end

  private

  def set_access_control_allow_origin_to_localhost
    response.set_header("Access-Control-Allow-Origin", "http://localhost:5173")
  end

  def calculate_derivate
    @operation_response =
      calculate_interactor.calculate_derivative(params.fetch(:expression), params.fetch(:variable))
  end

  def view_name_for_exception_cause(exception)
    return underscore_class_name(exception.cause) if exception.cause

    underscore_class_name(exception)
  end

  def underscore_class_name(object)
    object.class.name.underscore.split("/").last
  end

  def calculate_interactor
    SymDiffer::GetDerivativeOfExpressionInteractor.new
  end
end
