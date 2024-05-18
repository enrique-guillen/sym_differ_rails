# frozen_string_literal: true

require "rails_helper"

RSpec.describe "FirstOrderDifferentialEquationApproximations" do
  describe "GET /first_order_differential_equation_approximation" do
    subject(:get_first_order_differential_equation_approximation) do
      get("/first_order_differential_equation_approximation", params:)
    end

    context "when the expression is 2 * x, variable x" do
      let(:params) do
        { expression_text: "2 * x",
          undetermined_function_name: "y",
          variable_name: "x",
          initial_value_coordinates: %w[0 0] }
      end

      it "renders the expected value" do
        get_first_order_differential_equation_approximation

        expect(response).to have_attributes(
          parsed_body: a_hash_including(
            "approximated_solution" => a_collection_including(
              a_hash_including("abscissa" => 0.0, "ordinate" => 0.0),
              a_hash_including("abscissa" => 0.125, "ordinate" => 0.04687499999999999),
              a_hash_including("abscissa" => 0.5, "ordinate" => 0.37500000000000006),
              a_hash_including("abscissa" => 1.0, "ordinate" => 1.2500000000000004),
              a_hash_including("abscissa" => 5.0, "ordinate" => 26.25),
              a_hash_including("abscissa" => 10.0, "ordinate" => 102.50000000000003)
            )
          ),
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
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
        get_first_order_differential_equation_approximation

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
