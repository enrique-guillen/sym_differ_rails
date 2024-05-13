# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DerivativeExpressionVisualizations" do
  describe "GET /derivative_expression_visualization" do
    subject(:get_derivative_expression_visualization) do
      get("/derivative_expression_visualization", params:)
    end

    context "when the expression is x + x, variable x" do
      let(:params) { { expression: "x + x", variable: "x" } }

      it "renders the expected value" do
        get_derivative_expression_visualization

        expect(response).to have_attributes(
          parsed_body: a_string_including("<svg version").and(including("expression-curve-approximation")),
          headers: a_hash_including(
            "Content-Type" => "image/svg+xml",
            "Access-Control-Allow-Origin" => "http://localhost:5173"
          ),
          status: 200
        )
      end
    end

    context "when the expression is x + x, variable 123" do
      let(:params) { { expression: "x + x", variable: "123" } }

      it "renders the expected value" do
        get_derivative_expression_visualization

        expect(response).to have_attributes(
          parsed_body: { "message" => "invalid_variable_given_to_expression_parser_error",
                         "invalid_variable_name" => "123" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 422
        )
      end
    end
  end
end
