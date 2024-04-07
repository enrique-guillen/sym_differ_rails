# frozen_string_literal: true

require "sym_differ"
require "sym_differ/derivative_of_expression_getter"
require "sym_differ/free_form_expression_text_language/parser"
require "sym_differ/expression_reducer"
require "sym_differ/inline_printing/printing_visitor"
require "sym_differ/differentiation/differentiation_visitor"

# Temporary tentative implementation of DifferentiationVisitorBuilder.
class DifferentiationVisitorBuilder
  def build(variable)
    SymDiffer::Differentiation::DifferentiationVisitor.new(variable)
  end
end

# Allows computing the derivative of a given expression.
class DerivativeExpressionController < ApplicationController
  def show
    @operation_response =
      SymDiffer::DerivativeOfExpressionGetter
      .new(SymDiffer::FreeFormExpressionTextLanguage::Parser.new,
           DifferentiationVisitorBuilder.new,
           SymDiffer::ExpressionReducer.new,
           SymDiffer::InlinePrinting::PrintingVisitor.new)
      .get(params.require(:expression), params.require(:variable))

    render(formats: %i[json])
  end
end
