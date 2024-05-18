# frozen_string_literal: true

require "sym_differ/get_first_order_differential_equation_approximation_interactor"
class FirstOrderDifferentialEquationApproximationsController < ApplicationController
  include SymDifferExceptionHandlingConcern
  include AccessControlConcern

  def show
    calculate_first_order_differential_equation_approximation
    render formats: %i[json]
  rescue SymDiffer::Error => e
    handle_sym_differ_error(e)
  end

  private

  def calculate_first_order_differential_equation_approximation
    @operation_response = approximated_solution
  end

  def approximated_solution
    approximate_interactor
      .approximate_solution(params.fetch(:expression_text),
                            params.fetch(:undetermined_function_name),
                            params.fetch(:variable_name),
                            params.fetch(:initial_value_coordinates).map { |c| Float(c) })
  end

  def approximate_interactor
    SymDiffer::GetFirstOrderDifferentialEquationApproximationInteractor.new
  end
end
