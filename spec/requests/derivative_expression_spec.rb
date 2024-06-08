# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DerivativeExpressions" do
  describe "GET /derivative_expression" do
    subject(:get_derivative_expression) do
      get("/derivative_expression", params:)
    end

    context "when the expression is x + x, variable x" do
      let(:params) { { expression: "x + x", variable: "x" } }

      it "renders the expected value" do
        get_derivative_expression

        expect(response).to have_attributes(
          parsed_body: { "derivative_expression" => "2" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 200
        )
      end
    end

    context "when the expression is x + x, variable 123" do
      let(:params) { { expression: "x + x", variable: "123" } }

      it "renders the expected value" do
        get_derivative_expression

        expect(response).to have_attributes(
          parsed_body: { "message" => "invalid_variable_given_to_expression_parser_error",
                         "invalid_variable_name" => "123" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 422
        )
      end
    end

    context "when the expression is 123x%, variable x" do
      let(:params) { { expression: "123%", variable: "x" } }

      it "renders the expected value" do
        get_derivative_expression

        expect(response).to have_attributes(
          parsed_body: { "message" => "unrecognized_token_error",
                         "invalid_expression_text" => "%" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 422
        )
      end
    end

    context "when the expression is empty, variable x" do
      let(:params) { { expression: "", variable: "x" } }

      it "renders the expected value" do
        get_derivative_expression

        expect(response).to have_attributes(
          parsed_body: { "message" => "empty_expression_text_error" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 422
        )
      end
    end

    context "when the expression is ++, variable x" do
      let(:params) { { expression: "++", variable: "x" } }

      it "renders the expected value" do
        get_derivative_expression

        expect(response).to have_attributes(
          parsed_body: { "message" => "invalid_syntax_error" },
          headers: a_hash_including("Access-Control-Allow-Origin" => "http://localhost:5173"),
          status: 422
        )
      end
    end
  end
end
