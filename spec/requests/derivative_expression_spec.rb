# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DerivativeExpressions" do
  describe "GET /derivative_expression" do
    it "renders the expected value" do
      get("/derivative_expression", params: { expression: "x + x", variable: "x" })
      expect(JSON.parse(response.body)).to eq("derivative_expression" => "2")
    end
  end
end
