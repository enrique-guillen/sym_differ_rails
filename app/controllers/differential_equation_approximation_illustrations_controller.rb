# frozen_string_literal: true

require "sym_differ/illustrate_differential_equation_approximation_interactor"
require "sym_differ/error"

# Allows visualization the approximation to the solution of a given differential equation.
class DifferentialEquationApproximationIllustrationsController < ApplicationController
  include SymDifferExceptionHandlingConcern
  include AccessControlConcern

  def show
    response = illustrate

    send_data response.image, type: "image/svg+xml"
  rescue SymDiffer::Error => e
    handle_sym_differ_error(e)
  end

  private

  def illustrate
    @operation_response = illustrate_approximation
  end

  def illustrate_approximation
    illustrate_interactor.illustrate_approximation(
      params.fetch(:expression_text),
      params.fetch(:undetermined_function_name),
      params.fetch(:variable_name),
      params.fetch(:initial_value_coordinates).map { |c| Float(c) }
    )
  end

  def illustrate_interactor
    SymDiffer::IllustrateDifferentialEquationApproximationInteractor.new
  end
end
