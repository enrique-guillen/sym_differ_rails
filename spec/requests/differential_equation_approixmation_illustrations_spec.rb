# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DifferentialEquationApproximationIllustrations" do
  describe "GET /differential_equation_approximation_illustration" do
    subject(:get_differential_equation_approximation_illustration) do
      get("/differential_equation_approximation_illustration", params:)
    end

    context "when the expression is 2 * x, variable x" do
      let(:params) do
        { expression_text: "2 * x",
          undetermined_function_name: "y",
          variable_name: "x",
          initial_value_coordinates: %w[0 0] }
      end

      it "renders the expected value" do
        get_differential_equation_approximation_illustration

        expect(response).to have_attributes(
          parsed_body: a_string_including("<svg version").and(including("ordinate")),
          headers: a_hash_including(
            "Content-Type" => "image/svg+xml",
            "Access-Control-Allow-Origin" => "http://localhost:5173"
          ),
          status: 200
        )
      end
    end

    context "when the expression is x + x, variable 123omg (error example)" do
      let(:params) do
        { expression_text: "2 * x",
          undetermined_function_name: "y",
          variable_name: "123omg",
          initial_value_coordinates: %w[0 0] }
      end

      it "renders the expected value" do
        get_differential_equation_approximation_illustration

        expect(response).to have_attributes(
          parsed_body: { "message" => "invalid_variable_given_to_expression_parser_error",
                         "invalid_variable_name" => "123omg" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 422
        )
      end
    end
  end
end
